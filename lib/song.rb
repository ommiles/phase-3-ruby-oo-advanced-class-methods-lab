class Song
  attr_accessor :name, :artist_name

  # @@all stores all instances for Song that are created through the instance method Song#save
  @@all = []

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

  def self.create
    self.new.save #instantiates new song
    self.all[self.all.size-1] # returns song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name # writer method
    song # reader method
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    # can find a song present in @@all by name
    # detect returns the first for which block is not false
    # returns falsey when a song name is not present in @@all
    self.all.detect{|song| song.name == song_name} 
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
