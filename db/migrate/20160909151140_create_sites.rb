class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :city, :string
      t.column :country, :string
      t.column :zip, :string
      t.column :description, :text
      t.column :contact, :string
      t.column :phone, :string
      t.column :email, :string
      t.column :url, :string
      t.column :class_resource, :string
      t.column :site_type, :string
      t.column :pin_type, :string
      t.column :happening_now, :string
      t.column :notes, :text
      t.column :region, :string
      t.column :summer_classes, :string
      t.column :students_served, :integer

      t.timestamps
    end
  end
end
