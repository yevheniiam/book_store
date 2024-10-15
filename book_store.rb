# Клас для опису полиці 
class Shelf
  attr_accessor :position

  def initialize(position)
    @position = position
  end
end
# Клас для опису товару - алена
class Item
  attr_accessor :id, :popularity

  def initialize(id, popularity)
    @id = id
    @popularity = popularity
  end
end
# Клас для управління інвентарем (сортування товарів та полиць)  - алена
class InventoryManager
  def initialize(items, shelves)
    @items = items
    @shelves = shelves
  end

  # Сортуємо товари за популярністю - алена
  def sort_items_by_popularity
    @items.sort_by { |item| -item.popularity }
  end
