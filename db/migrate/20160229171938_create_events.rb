class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id: :uuid do |t|
      t.uuid :venue_id, index: true, null: false, foreign_key: true
      t.datetime :starts_at
      t.integer :price
      t.boolean :soldout, null: false, default: false

      t.timestamps null: false
    end
  end
end
