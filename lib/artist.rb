class Artist
    attr_accessor :name

    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
      @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end

    def songs 
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(artistname)
        search_artist = self.all.find{|artist| artist.name == artistname}
        if search_artist
            search_artist
        else
            newartist = self.new(artistname) 
            newartist
        end

    end

    def print_songs 
        Song.all.each do |song|
            if song.artist == self
                puts "#{song.name}"
            end
        end
    end
  
    # other methods
  
  end 