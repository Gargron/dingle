class CreateProviderSuggestions < ActiveRecord::Migration
  def change
    create_table :provider_suggestions do |t|
      t.integer :country_id
      t.string :name

      t.timestamps
    end
  end
end
