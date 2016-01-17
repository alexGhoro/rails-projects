class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :user, index: true
    add_foreing_key :articles, :users
  end
end
