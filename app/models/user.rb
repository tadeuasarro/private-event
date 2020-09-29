class User < ApplicationRecord
  has_many :events, foreign_key: 'id'
end
