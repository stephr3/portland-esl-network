class RemovePinType < ActiveRecord::Migration[5.0]
  def change
    remove_column :sites, :pin_type
  end
end
