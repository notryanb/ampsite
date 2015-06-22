class Triode < ActiveRecord::Base
  has_many :datasheets

  def type
    "Triode"
  end
end