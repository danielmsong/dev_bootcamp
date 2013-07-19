get '/' do
  @word = ''
  erb :index
end

get '/:word' do
  @word = params[:word]
  @anagrams = []
  Word.anagrams(@word).each { |word| @anagrams << word.word }
  erb :index
end
