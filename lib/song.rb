class Song
    attr_accessor :artist, :name, :genre

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

      def self.all
        @@all
      end

      def self.new_by_filename(filename)
        song = filename.split(" - ")
        songname = song[1]
        artist = song[0]
        genre = song[2]
        newsong = self.new(songname)
        newsong.artist_name = artist
        newsong
      end

      def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
      end


  end 