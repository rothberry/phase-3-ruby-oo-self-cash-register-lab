
class CashRegister

  attr_reader :discount, :items_array
  attr_accessor :total

  @@all = []

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items_array = []

    @@all << self
  end

  def self.all
    @@all
  end

  # !HOW TO DELETE AN INSTANCE
  def delete
    @@all = @@all.filter{|p| p != self}
    puts "#{@name} removed from system"
  end
 

  def add_item(title, price, quantity=1)
    # ! FIRST ITERATION
    # quantity.times do 
    #   @items_array.push({title: title, price: price})
    # end
    @items_array.push({title: title, price: price, quantity: quantity})
    @total += (price * quantity)
  end
  
  def apply_discount
    if @discount > 0
      @total = ((100 - @discount) / 100.0 * @total )
      return "After the discount, the total comes to $#{@total.to_i}."
    else 
      return "There is no discount to apply."
    end
  end
  
  def items
    # binding.pry
    # ! FIRST ITERATION
    # self.items_array.map do |item|
    #   item[:title]
    # end

    item_name_array = []
    self.items_array.each do |item|
      item[:quantity].times do
        item_name_array << item[:title]
      end
    end
    return item_name_array
  end
  
  def void_last_transaction
    # binding.pry
    if self.items_array.length > 0
      item_to_be_removed = self.items_array.pop
      @total -= (item_to_be_removed[:price] * item_to_be_removed[:quantity])
    end
  end

end
