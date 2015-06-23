class Triodepentode < ActiveRecord::Base
  has_many :datasheets
  has_one :pinout, as: :pinoutable

  def type
    "Triode-Pentode"
  end
  
end