class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true

  has_many :posts_tags
  has_many :tags, :through => :posts_tags

  attr_accessor :tag_list
  before_save :filter_tags

  private

  def filter_tags
    if tag_list
      self.tags.clear
      self.tag_list.split(' ').each do |tag|
        t = Tag.find_or_create_by_name(tag.strip)
        tags << t
      end
    end
  end

end
