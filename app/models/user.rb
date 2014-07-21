class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :followers
  has_many :messages

  validates :username, presence: true
  validates :name, presence: true

  def follow!(other_user)
    followers.create them_id: other_user.id
  end

  def follow?(other_user)
    followers.where(them_id: other_user.id).any?
  end
end
