class Group < ApplicationRecord
  has_many :chats
  has_many :users, through: :user_groups
  has_many :user_groups
  accepts_nested_attributes_for :user_groups
end
