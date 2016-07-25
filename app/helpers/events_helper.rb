module EventsHelper
	def is_friend? guest_id
		if current_user.friendships.exists?(friend_id:guest_id) or current_user.inverse_friendships.exists?(user_id:guest_id)
	        return false
	    else
			return true
		end
	end

	def friend_request_list
		current_user.inverse_friendships.where(status:"pendding")
	end

	def friend_list1
		current_user.friendships.where(status:"accept")
		#Friendship.where("(user_id=? or friend_id=?) and status=?",current_user,current_user.id,"accept")
	end
	def friend_list2
		current_user.inverse_friendships.where(status:"accept")
	end

	def event_count
		friend_list1.count + friend_list2.count
	end
end
