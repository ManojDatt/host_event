class CommentRelayJob < ApplicationJob
  queue_as :default

  def perform(data)
  	p"========#{data.inspect}====="
    ActionCable.server.broadcast "events:#{data.event_id}:comments" , content:data.content, time:data.created_at, 
    user: "#{User.find(data.user_id).name}"
  end

end

