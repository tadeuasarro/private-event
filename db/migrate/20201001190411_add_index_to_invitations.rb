class AddIndexToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_index(:invitations, [:invited_user_id, :event_id])
  end
end
