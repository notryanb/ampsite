class Pinout < ActiveRecord::Base
  belongs_to :pinoutable, polymorphic: true
end