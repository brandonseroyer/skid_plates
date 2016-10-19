class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
