class RemoveYearColumnFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :year
  end
end
