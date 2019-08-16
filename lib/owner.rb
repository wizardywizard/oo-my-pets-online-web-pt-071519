require "pry"
class Owner
   attr_reader :species, :name
  attr_accessor :pets, :dog, :cat

  @@all = []
  @@pets = {:dogs => [], :cats => []}

  def initialize(name = "Victoria")
    @species = "human"
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @@pets
  end
  
  def cats 
     Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    @@pets[:cats] << Cat.new(cat, self)
  end

  def buy_dog(dog)
    @@pets[:dogs] << Dog.new(dog, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def list_pets
    #binding.pry
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def sell_pets
    pets = dogs + cats
    
    pets.each do |pet|
      pet.mood = 'nervous'
      pet.owner = nil
    end
<<<<<<< HEAD
  end
    
end
=======
    
  #   pets.each do |pet, arr|
  #     arr.map do |pets|
  #       binding.pry
  #       pets.mood = 'nervous'
  #     end
  #     arr.clear
  #   end
  # end

end

      # it 'can sell all its pets, which makes them nervous' do
      #   fido = Dog.new("Fido", @owner)
      #   tabby = Cat.new("Tabby", @owner)

      #   [fido, tabby].each {|o| o.mood = "happy" }

      #   @owner.sell_pets

      #   [fido, tabby].each { |o| expect(o.mood).to eq("nervous") }
      # end
















>>>>>>> 1cb2c4c57b6a478c21c05b135e5c33ba6c42bbc0
