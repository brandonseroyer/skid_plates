class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.column :photo_file, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :gallery_id, :integer
      
      t.timestamps
    end
  end
end
