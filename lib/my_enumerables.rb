module Enumerable
  def my_each_with_index
    i = 0
    my_each do |value|
      yield value, i
      i += 1
    end
  end

  def my_select
    final_array = []
    my_each do |value|
      final_array << value if (yield value) == true
    end
    final_array
  end

  def my_all?
    array = []
    my_each do |value|
      array << (yield value)
    end
    if array.uniq.count == 1
      true
    else
      false
    end
  end

  def my_any?
    array = []
    my_each do |value|
      array << (yield value)
    end
    if array.include?(true)
      true
    else
      false
    end
  end

  def my_none?
    array = []
    my_each do |value|
      array << (yield value)
    end
    if !array.include?(true)
      true
    else
      false
    end
  end

  def my_count
    count = 0
    if block_given?
      my_each do |value|
        count += 1 if (yield value) == true
      end
    else
      my_each do
        count += 1
      end
    end
    count
  end

  def my_map
    array = []
    my_each do |value|
      array << (yield value)
    end
    array
  end

  def my_inject(initial_value = 0)
    sum = initial_value
    my_each do |value|
      sum = (yield value, sum)
    end
    sum
  end
end

# bundle exec rspec spec/my_inject_spec.rb
# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for value in self do
      yield value
    end
  end
end

enumerable = [1, 1, 2, 3, 5, 8, 13, 21, 34]
enumerable.my_inject(0) { |sum, value| sum + value }