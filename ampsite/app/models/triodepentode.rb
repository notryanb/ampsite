class Triodepentode < ActiveRecord::Base
  has_many :datasheets, as: :datasheetable
  has_one :pinout, as: :pinoutable
  has_one :tubesocket, through: :pinout

  def type
    "Triode-Pentode"
  end
  
end