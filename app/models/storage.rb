class Storage < ActiveRecord::Base
  attr_accessor :book_space

 def initialize
    @book_space = 1
  end

  #def book_space
  #  @book_space = 6
  #end

end
