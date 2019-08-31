require 'pry'

class Artist
  
    attr_accessor :name, :genre, :artist, :songs
    attr_reader :songs
    @@all = []

    def self.create(name)
        new(name).save  
    end

    def add_artist
        @@all << artist.new
    end

    def self.find_by_name(name)
        @@all.detect{|artist| artist.name == name}
    end

    def initialize(name)
        @name = name
        @songs = []
        
        save
    end

    def save        # Instance Method
        @@all << self
        self
    end


    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
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