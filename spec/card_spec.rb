require_relative 'spec_helper'

describe 'card specifications' do
  before do
    @search_result = Spotify::Search.new('Eyes Shut')
    @track_id = '2xzzSkFGtf0w5ZATRYa1Tg'
  end

  it 'should be able to get a hash from Search Class' do
    @search_result.get_songs.is_a?(Hash)
  end

  it 'should be able to get a track_id' do
    @search_result.get_songs[@track_id].track_id = @track_id
  end
end
