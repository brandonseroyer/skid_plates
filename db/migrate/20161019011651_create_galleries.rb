class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.column :name, :string
      t.column :product_id, :integer

      t.timestamps
    end
  end
end
