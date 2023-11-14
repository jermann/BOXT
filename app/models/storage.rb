class Storage < ActiveRecord::Base
  attr_accessor :book_space

  has_one_attached :image

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :available_space, presence: true, numericality: {greater_than: 0}, on: [:create, :update, :edit]
  validates :start_date, presence: true
  validates :end_date, presence: true, date: { after: :start_date}, on: [:create, :update, :edit]
  validates :price, presence: true, numericality: {:greater_than => 0}, on: [:create, :update, :edit]
  validates_inclusion_of :rating, in: 1..5

end
