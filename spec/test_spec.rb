require 'rails_helper'

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def output
    if @age >= 18
      "#{@age}-#{@name} is a #{@age} year-old student"
    else
      "#{@name} is a #{@age} year-old pupil"
    end
  end

  def is_child
    @age < 18 ? true : false
  end
end

describe Author do
  before do
    @param = [1, 2, 3]
  end
  it 'first test' do

  end
end