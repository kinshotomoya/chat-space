class User < ApplicationRecord
  has_many :groups, through: :user_groups
  has_many :user_groups
  has_many :chats


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :name, presence: true
end
