class Rating < ActiveRecord::Base
  belongs_to :storage
  belongs_to :user
end
