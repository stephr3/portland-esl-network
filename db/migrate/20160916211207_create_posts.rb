class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :admin_id, :integer

      t.timestamps
    end
  end
end
