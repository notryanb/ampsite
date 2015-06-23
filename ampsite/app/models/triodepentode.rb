class Triodepentode < ActiveRecord::Base
  has_many :datasheets
  has_one :pinout, as: :pinoutable
  has_one :tubesocket, through: :pinout

  def type
    "Triode-Pentode"
  end
  
end