class Event < ApplicationRecord
  belongs_to :hosting_user, foreign_key: 'hoster_id', class_name: "User"

  has_many :invitations, foreign_key: "event_id"
  has_many :invited_users, through: :invitations, source: "invited_users"
end
