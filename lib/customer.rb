class Customer
  attr_accesor :name, :age

@@all =[]  

def initialize (name, age)
  @name = name
  @age =age
  @@all << self
end

def self.all
  @@all
end
def meals
  Meal.all.select do |meal|
  meal.customer == self
end

def waiters
  meals.map do |meal|
  meal.waiter
    
def new_meal
  end
end