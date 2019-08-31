require 'pry'

class Song
    attr_accessor :name, :songs
    attr_reader :artist, :genre 
    @@all = []

    def self.create(name)
       new(name).save

    end

    def save        # Instance Method
        @@all << self
        self
    end
    
    def initialize(name,artist=nil,genre=nil)
        @name = name
        self.artist = artist
        self.genre = genre 
        save
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
        @@all.detect{|song| song.name == name}
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