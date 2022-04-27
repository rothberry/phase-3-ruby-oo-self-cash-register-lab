require 'pry'

class CashRegister

  attr_reader :discount#, :items
  attr_accessor :total

  # optional arg???
  def initialize(discount=0)
    @total = 0
    # self.total = 0 # is the as ^^^
    @discount = discount
    @items = []
    # @last_transaction = 0
    # [{title, price, quantity}, {} ...]
  end

  def get_total_by_list
    p "get total"
    @items.map do |item|
      item[:price] * item[:quantity]
    end.sum
  end


  
  # def total=(new_total)
  #   p "set total"
  #   @total = new_total
  # end

  def add_item(title, price, quantity=1)
    # expect to increase the total by price
    @total += (price * quantity)
    # @last_transaction = price * quantity
    # quantity.times do
    #   @items.push(title)
    # end
    
    # with holding onto items
    @items.push({title: title, price: price, quantity: quantity})
  end
  
  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    else
      # ex: discount = 20
      # total = 1000 => 800
      # @total = @total - (@discount).to_f / 100 * @total
      self.total = self.total - (self.discount).to_f / 100 * self.total
      # total = total - (discount).to_f / 100 * total
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def list_items
    # loop through our @items
    # output all the titles with their respective quantities
    
    # if quantities are always 1
    # @items.map { |i| i[:title] }
    
    # if quantities are whatever?
    # how to get in input array of n items, and on 
    # output array of m >= n items
    output = []
    @items.each do |item|
      item[:quantity].times do 
        output << item[:title]
      end
    end
    return output
  end

  def void_last_transaction
    # binding.pry
    # need to remove the last item hash in list
    last_item = self.items.pop
    # subtract price * quantity back into total
    self.total -= (last_item[:price] * last_item[:quantity])
  end

end

puts "TESTING..."
cash_register = CashRegister.new
cash_register_with_discount = CashRegister.new(20)

p cash_register.total

binding.pry