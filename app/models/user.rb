class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def online?
  $redis_onlines.exists( self.id )
  end

  has_many :join_events 
  has_many :events , dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :comments , dependent: :destroy
  has_many :inverse_friendships, class_name:"Friendship", foreign_key:"friend_id"
  has_many :inverse_friends, through: :inverse_friendships , source: :user
  has_many :likes
end
