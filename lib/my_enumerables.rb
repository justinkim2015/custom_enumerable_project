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

  
end

# bundle exec rspec spec/my_select_spec.rb
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

enumerable = [4,23,5,21,3,2,1,8]
enumerable.my_select { |value| value > 10 }