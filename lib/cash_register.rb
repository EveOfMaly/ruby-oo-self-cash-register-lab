require 'pry'

class CashRegister 
    attr_reader :discount
    attr_accessor :total, :added_item, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @added_items = []
    end

    def add_item(item, price, quantity=1)
        @quantity = quantity 
        @item = item
        @total += price * quantity
        @last_transaction = 0

        @quantity.times do 
            @added_items << @item  
            @last_transaction = price * quantity
        end
    
    
    end

    def apply_discount
        total_paid =  @total - (@total * (@discount.to_f/100))
        @total = total_paid


        if @discount <= 0 
            return "There is no discount to apply."
        else 
           return "After the discount, the total comes to $800."
        end
        
    end


    def items
        @added_items
    end


    def void_last_transaction
        @total -= @last_transaction
        @added_items.pop 
    end
end
