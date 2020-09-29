class AddHosterIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :hoster_id, :integer
  end
end
