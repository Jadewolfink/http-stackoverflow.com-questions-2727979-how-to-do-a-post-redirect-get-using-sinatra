class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url_address
      t.string :shorten_url
      t.integer :counter, default: 0
      t.timestamps
    end
  end
end
