class AddDefaultValuesInProviders < ActiveRecord::Migration
  def change
    change_column :providers, :score, :float, :default => 0.0
    change_column :providers, :overall, :float, :default => 0.0
    change_column :providers, :privacy, :float, :default => 0.0
    change_column :providers, :support, :float, :default => 0.0
    change_column :providers, :stability, :float, :default => 0.0
    change_column :providers, :price_value, :float, :default => 0.0

    add_index :providers, :score
  end
end
