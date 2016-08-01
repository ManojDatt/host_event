class CommentRelayJob < ApplicationJob
  queue_as :default

  def perform(data, time)
  	p"========#{data.inspect}====="
    ActionCable.server.broadcast "events:#{data.event_id}:comments" , content:data.content, time: time, 
    user: "#{User.find(data.user_id).name}"
  end

end

