class Song
    attr_accessor :name, :genre, :artist, :songs
    @@all = []

    
    def self.all # Class Reader
        @@all
    end
    
    def self.create
        @@all = Song.new
        @@all.save
        return song
    end

    def self.count
        @@all.size
    end


    def self.destroy_all
        @@all.clear
    end
    
    def initialize
        save
    end

    def save
        @@all << self
    end

    def add_song(artist = "")
        @@all << Song.new
    end

    def self.find_by_name(name)
        @@all.detect{|song| song.name == name}


end