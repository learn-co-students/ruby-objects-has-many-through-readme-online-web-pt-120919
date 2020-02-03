class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)   # #new initializes with a name and years of experience
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all                          # .all  is class method that returns the contents of @@all
    @@all
  end

  def new_meal(customer, total, tip = 0 )  # #new_meal initializes a meal using the current Waiter instance,
    Meal.new(self, customer, total, tip)   #  a provided Customer instance and a total and tip
  end

  def meals
    Meal.all.select do |meal|          # #meals returns an Array of Meal instances associated with this waiter
      meal.waiter == self    # checking for waiter now
    end
  end



  def best_tipper                     # #best_tipper   returns the Customer instance associated with
    best_tipped_meal = meals.max do |meal_a, meal_b|    # the meal that received the largest tip
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end
end
