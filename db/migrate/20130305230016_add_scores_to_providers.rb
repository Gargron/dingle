class AddScoresToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :overall, :float
    add_column :providers, :privacy, :float
    add_column :providers, :support, :float
    add_column :providers, :stability, :float
    add_column :providers, :price_value, :float
  end
end
