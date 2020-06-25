class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self

  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def cats
    Cat.all.select { |cat_instance| 
      cat_instance.owner == self }
  end

  def dogs
    Dog.all.select { |dog_instance| 
      dog_instance.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each { |dog_instance| 
      dog_instance.mood = "happy" }
  end

  def feed_cats
    Cat.all.each { |cat_instance| 
      cat_instance.mood = "happy" }
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)." 
  end

  def sell_pets
    cats.each { |cat_instance| 
      cat_instance.mood = "nervous"
      cat_instance.owner = nil }
    dogs.each { |dog_instance| 
      dog_instance.mood = "nervous"
      dog_instance.owner = nil }
  end

end