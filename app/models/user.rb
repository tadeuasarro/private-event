class User < ApplicationRecord
  has_many :hosting_events, foreign_key: 'hoster_id', class_name: 'Event'

  has_many :invitations, foreign_key: 'invited_user_id', dependent: :destroy
  has_many :invited_events, through: :invitations, source: 'invited_events'
end
