class Song 
    attr_accessor :name, :artist
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

    def self.new_by_filename(file_name)
        artist_name = file_name.split(" - ")[0]
        song_name = file_name.split(" - ")[1]
        song_from_file = self.new(song_name)
        song_from_file.artist_name = artist_name
        song_from_file
    end 

    def artist_name=(name)
        #make new artist 
        new_artist = Artist.find_or_create_by_name(name)
        #new song's artist equal to new artist object 
        self.artist = new_artist
        #add song to the new artist
        new_artist.add_song(self)
    end 

end 