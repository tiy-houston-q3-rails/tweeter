class Follower < ActiveRecord::Base

  belongs_to :user
  validates :user, presence: true
  validates :them_id, presence: true
end
