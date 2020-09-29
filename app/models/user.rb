class User < ApplicationRecord
  has_many :hosting_events, class_name: 'Event', foreign_key: 'hoster_id'
end
