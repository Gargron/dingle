class AddKudosNumToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :kudos_num, :integer
  end
end
