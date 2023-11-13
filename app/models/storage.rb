class Storage < ActiveRecord::Base
  attr_accessor :book_space
  has_one_attached :image
end
