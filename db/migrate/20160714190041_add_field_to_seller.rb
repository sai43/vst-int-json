class AddFieldToSeller < ActiveRecord::Migration
  def change
    add_column :sellers, :name, :string
    add_column :sellers, :latitude, :string
    add_column :sellers, :longitude, :string
  end
end
