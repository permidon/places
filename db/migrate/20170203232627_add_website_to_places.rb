class AddWebsiteToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :website, :string
  end
end
