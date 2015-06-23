class Tetrode < ActiveRecord::Base
  has_many :datahsheets
  has_one :pinout, as: :pinoutable
end