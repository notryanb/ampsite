class Tubesocket < ActiveRecord::Base
  has_one :pinoutable, through: :pinout
end