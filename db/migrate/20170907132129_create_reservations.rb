class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :property, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :room_request
      t.integer :status, default:0

      t.timestamps
    end
  end
end
