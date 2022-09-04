require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do 
    describe '#initialize' do
        before(:each) do 
            @dealership = Dealership.new('Acme Auto', '123 Main Street')
        end
        it 'is an instance of Dealership' do 
            expect(@dealership).to be_an_instance_of Dealership
        end
        it 'has an inventory' do 
            expect(@dealership.inventory).to eq([])
        end
        it 'has a name' do 
            expect(@dealership.name).to eq('Acme Auto')
        end
        it 'has an address' do 
            expect(@dealership.address).to eq('123 Main Street')
        end
    end
    describe '#inventory_count' do 
        it 'returns the number of cars in inventory' do 
            dealership = Dealership.new('Acme Auto', '123 Main Street')

            expect(dealership.inventory_count).to eq(0)
        end
    end
    describe '#add_car' do 
        it 'adds a new car to the inventory' do 
            dealership = Dealership.new('Acme Auto', '123 Main Street')
            car_1 = Car.new("Ford Mustang", 1500, 36)
            car_2 = Car.new("Toyota Prius", 1000, 48)
            dealership.add_car(car_1)
            dealership.add_car(car_2)

            expect(dealership.inventory).to eq([car_1, car_2])
            expect(dealership.inventory_count).to eq(2)
        end
    end
    describe '#has_inventory?' do 
        it 'returns true or false if there are cars in inventory' do 
            dealership = Dealership.new('Acme Auto', '123 Main Street')
            car_1 = Car.new("Ford Mustang", 1500, 36)

            expect(dealership.has_inventory?).to be false

            dealership.add_car(car_1)

            expect(dealership.has_inventory?).to be true
        end
    end
    describe '#cars_by_make' do 
        before(:each) do 
            @dealership = Dealership.new('Acme Auto', '123 Main Street')
            @car_1 = Car.new("Ford Mustang", 1500, 36)
            @car_2 = Car.new("Toyota Prius", 1000, 48)
            @car_3 = Car.new("Toyota Tercel", 500, 48)
            @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
            @dealership.add_car(@car_1)
            @dealership.add_car(@car_2)
            @dealership.add_car(@car_3)
            @dealership.add_car(@car_4)
        end 
        it 'returns an array of cars according to make' do 
            expect(@dealership.cars_by_make('Toyota')).to eq([@car_2, @car_3])
        end
        it 'can return other requested makes' do 
            expect(@dealership.cars_by_make('Ford')).to eq([@car_1])
        end
    end
    describe '#total value' do 
        before(:each) do 
            @dealership = Dealership.new('Acme Auto', '123 Main Street')
            @car_1 = Car.new("Ford Mustang", 1500, 36)
            @car_2 = Car.new("Toyota Prius", 1000, 48)
            @car_3 = Car.new("Toyota Tercel", 500, 48)
            @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
            @dealership.add_car(@car_1)
            @dealership.add_car(@car_2)
            @dealership.add_car(@car_3)
        end 
        it 'returns total value of cars in inventory' do
            expect(@dealership.total_value).to eq(126000)
        end
        it 'changes when cars are added' do 
            @dealership.add_car(@car_4)
            expect(@dealership.total_value).to eq(156000)
        end
    end
    describe '#details' do 
        before(:each) do 
            @dealership = Dealership.new('Acme Auto', '123 Main Street')
            @car_1 = Car.new("Ford Mustang", 1500, 36)
            @car_2 = Car.new("Toyota Prius", 1000, 48)
            @car_3 = Car.new("Toyota Tercel", 500, 48)
            @car_4 = Car.new("Chevrolet Bronco", 1250, 24)
            @dealership.add_car(@car_1)
            @dealership.add_car(@car_2)
            @dealership.add_car(@car_3)
            @dealership.add_car(@car_4)
        end 
        it 'returns hash of important details of dealership' do 
            expect(@dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
        end
    end 
    describe '#average_price_of_car' do 
        it 'returns average price of cars in inventory' do 
            dealership = Dealership.new('Acme Auto', '123 Main Street')
            car_1 = Car.new("Ford Mustang", 1500, 36)
            car_2 = Car.new("Toyota Prius", 1000, 48)
            car_3 = Car.new("Toyota Tercel", 500, 48)
            car_4 = Car.new("Chevrolet Bronco", 1250, 24)
            dealership.add_car(car_1)
            dealership.add_car(car_2)
            dealership.add_car(car_3)
            dealership.add_car(car_4)

            expect(dealership.average_price_of_car).to eq('39,000')
        end
    end
    describe '#cars_sorted_by_price' do 
        it 'returns array of cars from cheapest to most expensive' do
            dealership = Dealership.new('Acme Auto', '123 Main Street')
            car_1 = Car.new("Ford Mustang", 1500, 36)
            car_2 = Car.new("Toyota Prius", 1000, 48)
            car_3 = Car.new("Toyota Tercel", 500, 48)
            car_4 = Car.new("Chevrolet Bronco", 1250, 24)
            dealership.add_car(car_1)
            dealership.add_car(car_2)
            dealership.add_car(car_3)
            dealership.add_car(car_4)

            expect(dealership.cars_sorted_by_price).to eq([car_3, car_4, car_2, car_1])
        end
    end
    describe '#inventory_hash' do 
        it 'returns a hash of cars sorted by make' do 
            dealership = Dealership.new('Acme Auto', '123 Main Street')
            car_1 = Car.new("Ford Mustang", 1500, 36)
            car_2 = Car.new("Toyota Prius", 1000, 48)
            car_3 = Car.new("Toyota Tercel", 500, 48)
            car_4 = Car.new("Chevrolet Bronco", 1250, 24)
            dealership.add_car(car_1)
            dealership.add_car(car_2)
            dealership.add_car(car_3)
            dealership.add_car(car_4)

            expect(dealership.inventory_hash).to eq({"Ford"=> [car_1],
                    "Toyota"=> [car_2, car_3],
                    "Chevrolet"=> [car_4]
                }
            )
        end
    end
end 

