class Artist 
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

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
      song.artist = self
    end

    def self.create(name)
        new_artist = self.new(name)
        new_artist
    end 

    def self.find_artist(name)
        self.all.detect {|artist| artist.name == name}
    end 

    def self.find_or_create_by_name(name)
        self.find_artist(name) || self.create(name)
    end 

    def print_songs
        songs.each {|song| puts song.name}
    end 
end 