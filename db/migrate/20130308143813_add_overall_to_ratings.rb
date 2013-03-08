class AddOverallToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :overall, :float
  end
end
