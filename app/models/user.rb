class User < ActiveRecord::Base
  has_secure_password
  has_one :account, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :items_todo, through: :todo_lists, source: :todo_items
end
