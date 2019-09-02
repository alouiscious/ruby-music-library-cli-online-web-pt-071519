require 'pry'
require_relative './concerns/findable.rb'


class Genre
    extend Concerns::Findable
 

    attr_accessor :name 
    attr_reader :artist, :songs, :genre
    
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

    def self.find_or_create_by_name(name)
        # binding.pry
        self.find_by_name(name) || self.create(name)

    end

    def initialize(name)
        @name = name
        @songs =[]
    end

    # def initialize(name,artist=nil,genre=nil)
    #     @name = name
    #     self.genre = genre
    #     self.artist = artist
    #     save
    #     @songs = []
    # end

    def self.all # Class Reader
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def add_song(song)
        song.genre = self unless song.genre
        @songs << song unless @songs.include?(song)
    end

    def artists
        songs.collect {|song| song.artist}.uniq
        
    end
    
    def self.reset_all   # Class Method
        @@all.clear
    end

    def self.count       # Class Method
        @@all.size
    end




end