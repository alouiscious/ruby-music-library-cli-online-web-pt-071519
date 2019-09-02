require 'pry'
require_relative './concerns/findable.rb'

class Artist
    extend Concerns::Findable
  
    attr_accessor :name
    attr_reader :songs, :genre, :artist

    @@all = []

 
    def initialize(name)
        @name = name
        @songs =[]
    end
    # def initialize(name,artist=nil,genre=nil)
    #     @name = name
    #     self.artist = artist
    #     self.genre = genre 
    #     save
    # end

    def self.create(name)
        new(name).save  
    end

    def add_artist
        @@all << artist.new
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

    def save        # Instance Method
        @@all << self
        self
    end


    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless @songs.include?(song)
    end
    
    def genres
    # binding.pry
        songs.collect { |song| song.genre }.uniq
        
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