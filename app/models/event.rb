class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'hoster_id'
end
