class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :bookings
  attr_accessor :listings

  def listing()
    storages = Storage.where(user: self.id)
    self.listings = storages
  end

  def new_booking(id, bs)
    if self.bookings.nil?
      self.bookings = []
    end

    self.update_attribute(:bookings, self.bookings.push({"storage_id" => id, "booked_space" => bs, "rating" => nil}))
  end

end
