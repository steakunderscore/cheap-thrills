class RenamePriceToPriceCentsOnEvent < ActiveRecord::Migration
  def change
    rename_column :events, :price, :price_cent
  end
end
