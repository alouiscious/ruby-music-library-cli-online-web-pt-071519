
#!usr/bin/env ruby
require_relative '../config/environment'

class MusicLibraryController
    attr_reader :path

    def initialize (path = "./db/mp3s")
    MusicImporter.new(path).import

    end

    def call 
        # input = []
    
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
            input = gets.strip

        while input != exit
            if input.eql? "list songs"
                list_songs
            elsif input.eql? "list artists"
                list_artists
            elsif input.eql? "list genres"
                list_genres
            elsif input.eql? "list artist"
                list_artist
            elsif input.eql? "list genre"
                list_genre
            elsif input.eql? "play songs"
                play_song
            elsif input.eql? "exit"
                exit
            end
        end
    
    end

    def list_songs
        Songs.sort(ascending)
    end

    def list_artists
        @@all.artist.sort(ascending)
    end

    def list_genres
        @@all.genre.sort(ascending)
    end
end