class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
   song = self.new
   song.save
   song
 end

   def self.new_by_name(name)
   song = Song.new
   song.name = name
   song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   if !self.find_by_name(name)
     self.create_by_name(name)
   else
     self.find_by_name(name)
   end
  end

 def self.alphabetical
   Song.all.sort_by{|song|song.name}
 end

 def self.new_from_filename(name)
   name.split(/[-.]/)
   name
 end

 def self.destroy_all
   self.all.clear
 end

end
