class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :cookie
      t.string :url

      t.timestamps
    end
    add_index :tracks, :cookie
  end
end
