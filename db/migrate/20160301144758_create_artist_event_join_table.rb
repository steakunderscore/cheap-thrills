class CreateArtistEventJoinTable < ActiveRecord::Migration
  def change
    # Can't use `create_join_table() because it hard codes using integer ids
    create_table "artists_events", id: false, force: :cascade do |t|
      t.uuid "artist_id", null: false
      t.uuid "event_id",  null: false

      t.index [:artist_id, :event_id], unique: true
      t.index [:event_id, :artist_id], unique: true
    end
  end
end
