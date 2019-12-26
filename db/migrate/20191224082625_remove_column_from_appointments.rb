class RemoveColumnFromAppointments < ActiveRecord::Migration[6.0]
  def change

    remove_column :appointments, :user_id_id, :integer
  end
end
