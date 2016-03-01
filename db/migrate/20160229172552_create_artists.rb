class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
