require 'pry'

class Genre
 

    attr_accessor :name
    attr_reader :genre, :artist, :songs
    @@all = []

    def self.create(name)
         new(name).save
    end

    def save        # Instance Method
        @@all << self
        self
    end    

    def add_genre
        @@all << genre.new
    end

    def self.find_by_name(name)
        @@all.detect{|genre| genre.name == name}
    end

    def initialize(name,artist=nil,genre=nil)
        @name = name
        @genre = genre
        @songs = []
        self.genre = genre
        self.artist = artist
        save
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