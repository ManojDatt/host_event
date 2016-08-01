class Event < ApplicationRecord
  belongs_to :user 
  has_many :join_events , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :likes
 
  delegate :email,:id,:name , to: :user
 
end
