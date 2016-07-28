class Event < ApplicationRecord
  belongs_to :user 
  has_many :join_events , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :likes
 

 # def guests
 # 	User.where.not(id: self.join_events.pluck(:user_id))
 # end
end
