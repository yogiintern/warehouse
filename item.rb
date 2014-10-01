class Item
  @@items = []
  attr_accessor :item_id,:name,:price,:min_stock,:current_stock
  def initialize(item_id,name,price=0)
    @item_id = item_id
    @name = name
    @price = price
    @min_stock = 0
    @current_stock = 0
    @@items << self
  end

  def self.purchase_items()
    list_items
    puts "Please enter item id to be purchased"
    item_id = gets
    item_id = item_id.to_i 
    item = @@items.select {|item| item.item_id == item_id}.first
    puts "Please No of item to be purchase"   
    no_of_item = gets 
    item.current_stock = item.current_stock+no_of_item.to_f
    item.to_print
  end

  def self.list_items
    puts "\n"
    @@items.each do |item|
      item.to_print
      puts "\n"
    end
  end

  def to_print
    puts "Item #{@item_id} : #{@name}"
    puts "Price : #{@price}"
    puts "Min Stock : #{@min_stock}"
    puts "Current Stock : #{@current_stock}"
  end
end
item1 = Item.new(1,"Apple")
item2 = Item.new(2,"Mango")
item3 = Item.new(3,"orange")
Item.list_items
Item.purchase_items()