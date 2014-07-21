class Message < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true, length: { maximum: 140 }
  validates :user, presence: true
end
