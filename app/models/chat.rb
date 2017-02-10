class Chat < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :text, presence: true

end
