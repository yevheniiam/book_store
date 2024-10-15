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

  # Сортуємо полиці за доступністю (позиція)
  def sort_shelves_by_position
    @shelves.sort_by(&:position)
  end
end

# Клас для розподілення товарів по полицях
class ItemShelfDistributor
  def initialize(sorted_items, sorted_shelves)
    @sorted_items = sorted_items
    @sorted_shelves = sorted_shelves
  end


  # Сортуємо товари за популярністю - алена
  def sort_items_by_popularity
    @items.sort_by { |item| -item.popularity }
  end

  # Розподіл товарів по полицях
  def distribute
    result = []

    # Призначаємо кожен товар на полицю
    @sorted_items.each_with_index do |item, index|
      result << { item_id: item.id, shelf_position: @sorted_shelves[index].position }
    end

    result
  end
end
# Приклад використання

# Створюємо масив товарів
items = [Item.new(1, 10), Item.new(2, 20), Item.new(3, 5)]

# Створюємо масив полиць
shelves = [Shelf.new(1), Shelf.new(2), Shelf.new(3)]

# 1. Перша людина сортує дані
inventory_manager = InventoryManager.new(items, shelves)

# Сортуємо товари за популярністю
sorted_items = inventory_manager.sort_items_by_popularity

# Сортуємо полиці за доступністю
sorted_shelves = inventory_manager.sort_shelves_by_position

# 2. Друга людина відповідає за розподіл товарів по полицях
distributor = ItemShelfDistributor.new(sorted_items, sorted_shelves)

# Отримуємо розподілення товарів по полицях
result = distributor.distribute

# Виводимо результат
puts result.inspect
