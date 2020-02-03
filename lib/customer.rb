class Customer
  attr_accessor :name, :age
  @@all = []

  def initialize(name, age)   # #new initializes with a name and age
    @name = name
    @age = age
    @@all << self
  end

  def self.all                # .all is class method that returns the contents of all
    @@all
  end

  def new_meal(waiter, total, tip = 0)      # #new_meal initializes a meal using the current
    Meal.new(waiter, self, total, tip)      # Customer instance, a provided Waiter instance and a total and tip
  end

  def meals
    Meal.all.select do |meal|               # #meals returns an Array of Meal instances
      meal.customer == self                 # associated with this customer
    end
  end

  def waiters                               # #waiters returns an Array of Waiter instances
    meals.map do |meal|                     #  associated with this customer's meals
      meal.waiter
    end
  end

end
