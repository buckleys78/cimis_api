class Station < ActiveRecord::Base
  has_many :temperatures
end
