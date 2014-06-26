module Api
  class Temperature < ActiveRecord::Base
    belongs_to :station

    validates :calendar_date, uniqueness: { scope: :station, message: "duplicate" }
  end
end
