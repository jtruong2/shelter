class RemoveStatusFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :status
  end
end
