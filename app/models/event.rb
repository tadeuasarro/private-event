class Event < ApplicationRecord
  belongs_to :hosting_user, foreign_key: 'hoster_id', class_name: "User"

  has_many :invitations, foreign_key: "event_id", dependent: :destroy
  has_many :invited_users, through: :invitations, source: "invited_users"
  
  scope :upcomming, -> { where("date >= ? ", Date.today) }
  scope :past, -> { where("date < ? ", Date.today) }

end
