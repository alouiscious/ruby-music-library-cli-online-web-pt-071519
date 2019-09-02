require 'pry'
require_relative './concerns/findable.rb'

class Song
    attr_accessor :name, :song
    attr_reader :artist, :genre, :songs 

    extend Concerns::Findable
    
    @@all = []

	def self.create(name) 
		song = Song.new(name)
		song.save
		song
    end 

    def save        # Instance Method
        @@all << self
        self
    end

    def initialize(name,artist=nil,genre=nil)
        @name = name
        self.genre = genre
        self.artist = artist
        @songs = []
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) if artist
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self) if genre
    end
    
    def add_song(artist)
        @@all << song.artist.new
        @songs
    end

    def self.find_by_name(name)
        @@all.find {|song| song.name == name}

    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
        # song = self.find_by_name(name)  # smaller code prevent calling find by name more than once
        # song ? song : self.create(name)

        # self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def self.new_from_filename(filename)
        artist, song, genre = filename.split(" - ")        #.split(".")
        new_song = self.find_or_create_by_name(song)
        new_song.artist_name = Artist.new
        new_song
    end

    def self.create_from_filename(filename)
        # filename.split(" - ")
        song = self.new_from_filename(filename)
        song.save
    end 

    def self.all # Class Reader
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.reset_all   # Class Method
        @@all.clear
    end

    def self.count       # Class Method
        @@all.size
    end


end