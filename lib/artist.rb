class Artist
    attr_accessor :name, :genre, :artist
    @@all = []

    
    def self.create
        @artist = artist.new
        save
    end
    
    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

end