require 'pry'

class Artist

@@all = []

def self.all
    @@all
end

def self.find_or_create_by_name(name)
    self.all.find do |artist|
      return artist if artist.name == name
    end
    self.new(name)
end

    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song_obj)
        song_obj.artist = self
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end



end