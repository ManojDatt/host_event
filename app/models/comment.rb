class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create_commit { CommentRelayJob.perform_now(self) }
end
