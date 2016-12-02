class CreateCarsTable < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.column :name, :string
      t.column :year, :string
      t.column :image_file_name, :string
      t.column :image_content_type, :string
      t.column :image_file_size, :integer
      t.column :image_updated_at, :datetime

      t.timestamps
    end
  end
end
