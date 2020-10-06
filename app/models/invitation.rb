class Invitation < ApplicationRecord
  belongs_to :invited_users, class_name: 'User', foreign_key: 'invited_user_id'
  belongs_to :invited_events, class_name: 'Event', foreign_key: 'event_id'
end
