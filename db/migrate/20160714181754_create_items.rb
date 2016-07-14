class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :price
      t.string :status
      t.datetime :published_date

      t.timestamps null: false
    end
  end
end
