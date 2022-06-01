require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def name
    @name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name= name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name= name
    song.save
    return song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else 
      return self.find_by_name(name)
    end 
  end 

  def self.alphabetical 
    @@all.sort_by { |obj| obj.name}
  end

  def self.new_from_filename(file)
    file.slice! ".mp3"
    a = file.split(/ - /)
    song = self.new_by_name(a[1])
    song.artist_name= a[0]
    return song
  end

  def self.create_from_filename(file)
    file.slice! ".mp3"
    a = file.split(/ - /)
    song = self.create_by_name(a[1])
    song.artist_name= a[0]
    return song
  end


  def self.destroy_all
    @@all = []
  end
end
