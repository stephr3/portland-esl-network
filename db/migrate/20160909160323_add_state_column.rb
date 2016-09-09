class AddStateColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :state, :string
  end
end
