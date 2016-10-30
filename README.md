# Spotifysearch Gem

Spotifysearch Gem helps you generate your song into a picture to share on social media!
* Auto search for nice album artwork
* Change the image you like
* Add comments on the image and songs to create your own awesome artwork!
* Share on multiple social network to express your music loving soul!

##Install

If you are working on a project, add this to your Gemfile: ```gem 'spotifysearch'```

For installation from command line:

```
$ gem install spotifysearch
```

##Usage

Require Spotifysearch gem in your code: require 'Spotifysearch'

You should use a track name as the input argument.

**Notice that you have to use plus sign ("+") instead of a blank to combine each word.

For example, If "Eyes Shut" is the track name you want to search, "Eyes+Shut" is the correct type of input. 

See the following example code for more usage details:

```
search = Spotify::Search.find(user_input)
puts 'Search Result:'
search.each_value do |songinfo|
		puts "track: #{songinfo.track_name}"
		puts "artist: #{songinfo.artist_name}"
		puts "album: #{songinfo.album_name}"
		puts "img_url: #{songinfo.imgs[0]}"
		puts
end
```
