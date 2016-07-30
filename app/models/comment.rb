class Comment < ApplicationRecord
 include ActionView::Helpers::DateHelper  #to use time_ago_in_words in model 
  belongs_to :user
  belongs_to :event
  after_create_commit { CommentRelayJob.perform_now(self, time_ago_in_words(self.created_at)) }
end
