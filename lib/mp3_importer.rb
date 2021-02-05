class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files
        #gets data from path + /ANYHTING in between.mp3
        file_list = Dir[@path + "/*.mp3"]
        #normalizes the file list to only the song names
        #each time collect loops, we only obtain the last element
        file_list.collect {|file| file.split("/").last}
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end 