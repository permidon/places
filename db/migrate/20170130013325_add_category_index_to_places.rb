class AddCategoryIndexToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :category, index: true
  end
end
