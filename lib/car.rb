class Car 
    attr_reader :make, :model, :monthly_payment, :loan_length, :color

    def initialize(make_model, monthly_payment, loan_length)
        @make = make_model.split(' ').shift
        @model = make_model.split(' ').pop
        @monthly_payment = monthly_payment
        @loan_length = loan_length
        @color = nil
    end

    def total_cost
        monthly_payment * loan_length
    end 

    def paint!(paint_color)
        @color = paint_color 
    end 
    
end
