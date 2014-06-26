module Api
  class Temperature < ActiveRecord::Base
    belongs_to :station
  end
end
