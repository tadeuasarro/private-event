class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index(:users, [:hoster_id, :invited_user_id])
  end
end
