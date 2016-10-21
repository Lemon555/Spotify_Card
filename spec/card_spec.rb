require_relative 'spec_helper'

describe 'card specifications' do
  before do
    @spotify_api = Spotify::SpAPI.new()
    @track_id = '2xzzSkFGtf0w5ZATRYa1Tg'
  end

  it 'should be able to get a hash from Search Class' do
    search = Spotify::Search.new(@spotify_api, 'Eyes Shut')
    search.get_songs.is_a?(Hash)
  end

  it 'should be able to get a track_id' do
    search = Spotify::Search.new(@spotify_api, 'Eyes Shut')
    search.get_songs[@track_id].track_id = @track_id
  end
end
