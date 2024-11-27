class RemoveRatingColumnFromFlat < ActiveRecord::Migration[7.1]
  def change
    remove_column :flats, :rating, :integer
  end
end
