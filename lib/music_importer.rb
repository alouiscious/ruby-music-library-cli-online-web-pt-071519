class MusicImporter
    attr_reader :path


    def initialize(path)
        @path = path
    
    end

    def files
        # Dir.entries(path).select {|path|         binding.pry
        # path.match('*.mp3')}

        @files ||= Dir.glob("#{path}/*.mp3").collect do |file|
        file.gsub("#{path}/", "")
        end
    end
    
      def self.import
        files.each {|file| Song.new_by_filename(file)}
      end

      def import
        files.each {|file| Song.create_from_filename(file)}
      end
      
      def self.new_from_filename(name)
        Song.new(name)
      end

      def self.create_from_filename(name)
        @all << Song.new(name)
      end

end