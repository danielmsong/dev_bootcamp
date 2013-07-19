class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username  
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_hash

      t.timestamps
    end  

    add_index :users, :username, :unique => true
  end
end
