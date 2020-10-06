class AddIndexToEvents < ActiveRecord::Migration[5.2]
  def change
    add_index(:events, [:hoster_id, :event_id])
  end
end
