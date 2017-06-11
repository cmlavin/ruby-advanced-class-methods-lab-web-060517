require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{ |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if song = self.find_by_name(song_name)
      song
    else
      new_song = self.create_by_name(song_name)
      new_song
    end
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name[0] }
  end

  def self.new_from_filename(filename)
    separated = filename.slice(0...-4).split(" - ")
    artist_name = separated[0]
    song_name = separated[1]
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
end
