
#!usr/bin/env ruby
require_relative '../config/environment'
# extend Concerns::Findable


class MusicLibraryController            # < Song
    attr_reader :path

    def initialize (path = "./db/mp3s")
    MusicImporter.new(path).import

    end

    def call 
        input = ""
        while input != "exit"
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

                if input.eql? "list songs"
                    list_songs
                elsif input.eql? "list artists"
                    list_artists
                elsif input.eql? "list genres"
                    list_genres
                elsif input.eql? "list artist"
                    list_songs_by_artist
                elsif input.eql? "list genre"
                    list_songs_by_genre
                elsif input.eql? "play song"
                    play_song
                end
        end
    
    end

    def list_songs
        Song.all.sort{|a, b| a.name <=> b.name }.uniq.each.with_index(1) do |songs, index|
            # binding.pry
            puts "#{index}. #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort{ |a, b| a.name <=> b.name }.uniq.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort{|a, b|a.name<=>b.name}.uniq.each.with_index(1) do |genre, index|
            puts "#{index}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_sort = gets.strip

        if artist = Artist.find_by_name(artist_sort)
            # binding.pry
            artist.songs.sort{|a, b|a.name <=> b.name}.each.with_index(1) do |songs, index|
                # puts "Songs by #{artist.name}:"
                puts "#{index}. #{songs.name} - #{songs.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_sort = gets.strip

        if genre = Genre.find_by_name(genre_sort)
            genre.songs.sort{|a, b|a.name <=> b.name }.each.with_index(1) do |songs, index|
                puts "#{index}. #{songs.artist.name} - #{songs.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
            song_sort = gets.strip.to_i
     
            while list_songs.to_a.length > song_sort
                # binding.pry
                if song_sort >= 1
                    return "Playing #{list_songs.to_a[song_sort].song.name} by #{list_songs.to_a[song_sort].artist.name}"
                end                    
            end

    end

end