class AddAcceptedToProviderSuggestions < ActiveRecord::Migration
  def change
    add_column :provider_suggestions, :accepted, :boolean, :default => false
  end
end
