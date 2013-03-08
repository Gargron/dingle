class AddScoreToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :score, :float
  end
end
