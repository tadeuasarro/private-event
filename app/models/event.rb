class Event < ApplicationRecord
  belongs_to :hosting_user, class_name: 'User'
end
