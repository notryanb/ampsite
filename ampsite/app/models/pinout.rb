class Pinout < ActiveRecord::Base
  belongs_to :pinoutable, polymorphic: true
  belongs_to :tubesocket
end