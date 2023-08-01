class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    # Добавление нового узла с данным значением в конец списка
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      current_node = @head
      current_node = current_node.next_node while current_node.next_node
      current_node.next_node = new_node
    end
  end

  def prepend(value)
    #добавление нового узла с данным значением в начало списка
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    #возвращаем общее количество узлов
    count = 0
    current_node = @head

    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def head
    #возрващаем перввй узел в списке
    @head
  end

  def tail
    #возвращаем последний узел в списке
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next_node while current_node.next_node

    current_node
  end

  def at(index)
    #возвращает узел по заданному индексу
    return nil if index < 0 || index >= size

    current_index = 0
    current_node = @head

    while current_index < index
      current_node = current_node.next_node
      current_index += 1
    end
    current_node
  end

  def pop
    #удаляет последний узел из списка

    return nil if @head.nil?

    if @head.next_node.nil?
      @head = nil
    else
      current_node = @head
      current_node = current_node.next_node while current_node.next_node
      current_node.next_node = nil
    end
  end

  def contains?(value)
    #проверяет, содержится ли переданное значение в списке
    current_node = @head

    while current_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    #возвращает индекс узла, содержащего заданное значение, или nil, если значение не найдено
    current_index = 0
    current_node = @head

    while current_node
      return current_index if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def to_s
    #предоставление объекта LinkedList в виде строк, чтобы можно было вывести их на консоль
    result = ""
    current_node = @head

    while current_node
      result += "( #{current_node.value} - > )"
      current_node = current_node.next_node
    end
    result += "nil"
  end

  def insert_at(value, index)
    #вставка нового узла с данным значением по заданному индексу
    return append(value) if index >= size
    return prepend(value) if index <= 0

    new_node = Node.new(value)
    previous_node = at(index-1)
    new_node.next_node = previous_node.next_node
    previous_node.next_node = new_node
  end

  def remove_at(index)
    #удаление узла по заданному индексу
    return nil if index < 0 || index >= size

    if index == 0
      @head = @head.next_node
    else
      previous_node = at(index-1)
      previous_node.next_node = previous_node.next_node.next_node
    end
  end
end

list = LinkedList.new
list.append(10)
list.append(20)
list.append(30)
list.prepend(5)
list.insert_at(2,0)
list.remove_at(0)
puts list
