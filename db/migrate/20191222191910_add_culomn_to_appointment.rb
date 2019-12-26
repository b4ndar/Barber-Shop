class AddCulomnToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_reference :appointments, :barber, null: false, foreign_key: true
    add_reference :appointments, :user, null: false, foreign_key: true

  end
end
