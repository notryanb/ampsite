class Diode < ActiveRecord::Base
  has_many :datasheets
  has_one :pinout, as: :pinoutable
end