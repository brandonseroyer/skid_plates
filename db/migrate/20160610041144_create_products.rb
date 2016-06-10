class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :product_id, :string
      t.column :price, :integer
      t.column :status, :boolean

      t.timestamps
    end
  end
end
