class Triodepentode < ActiveRecord::Base
  has_many :datasheets

  def type
    "Triode-Pentode"
  end
  
end