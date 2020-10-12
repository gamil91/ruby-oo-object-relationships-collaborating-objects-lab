require 'pry'

class MP3Importer

    attr_reader :path

    def initialize(file_path)
        @path = file_path
    end

    def files
        filenames = Dir.chdir(@path) do |path|
            Dir.glob("*.mp3")
        end
    end

    def import 
        self.files.each {|file| Song.new_by_filename(file)}
    end
       

end