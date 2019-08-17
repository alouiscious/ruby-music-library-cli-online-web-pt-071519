class Song
  
  attr_accessor :name
  @@all = []
  
  
  def initialize(name)
    
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  # def destroy_all
  def self.destroy_all
    # @@all = []
    @@all.clear
  end
  
  
#   song = Song.create
# Song.all.include?(song) #=> true


  def create(song)
    # song = self.create
    # song.save
    # song
end
  
end