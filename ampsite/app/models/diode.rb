class Diode < ActiveRecord::Base
  has_many :datasheets
  has_one :pinout, as: :pinoutable
  has_one :tubesocket, through: :pinout
end