class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :rooms_available
      t.references :user

      t.timestamps
    end
  end
end
