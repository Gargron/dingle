class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :provider_id
      t.integer :privacy
      t.integer :stability
      t.integer :support
      t.integer :price_value
      t.integer :user_id

      t.timestamps
    end
  end
end
