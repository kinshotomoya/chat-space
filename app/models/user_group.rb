class UserGroup < ApplicationRecord
  belongs_to :groups
  belongs_to :users

end
