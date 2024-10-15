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
