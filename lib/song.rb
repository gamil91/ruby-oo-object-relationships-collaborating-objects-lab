require 'pry'

class Song

    @@all = []
    
    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        name = file_name.split(" - ")[1]
        artist = file_name.split(" - ")[0]
        song = self.new(name)
        song.artist = Artist.find_or_create_by_name(artist)
        song
    end
    
    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end



end