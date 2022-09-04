class Dealership
    attr_reader :inventory, :name, :address

    def initialize(name, address)
        @inventory = []
        @name = name 
        @address = address
    end 

    def inventory_count
        @inventory.length
    end

    def add_car(car)
        @inventory << car
    end

    def has_inventory?
        @inventory.any?
    end

    def cars_by_make(make)
        @inventory.find_all { |car| car.make == make }
    end 

    def total_value
        @inventory.sum { |car| car.total_cost }
    end

    def details
        { 'total_value' => total_value, 'address' => @address }
    end

    def average_price_of_car
        (total_value / @inventory.length).to_s.insert(-4, ',')
    end

    def cars_sorted_by_price
        @inventory.sort_by { |car| car.total_cost }
    end 

    def inventory_hash
        @inventory.group_by { |car| car.make }
    end 
end