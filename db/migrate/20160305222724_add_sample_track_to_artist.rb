class AddSampleTrackToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :sample_track, :json
  end
end
