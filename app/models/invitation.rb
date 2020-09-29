class Invitation < ApplicationRecord
    belongs_to :user, foreign_key: "id"
    belongs_to :event, foreign_key: "id"
end
