module Api
  class Station < ActiveRecord::Base
    has_many :temperatures

    # def get_temperatures_from_local_db
    #   @temperatures =
    # end
  end
end
