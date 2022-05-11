module Enumerable
  def my_each_with_index
    i = 0
    my_each do |value|
      yield value, i
      i += 1
    end
  end

  def my_select
  end 
end

# bundle exec rspec spec/my_each_with_index_spec.rb
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

