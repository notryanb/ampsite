class Diode < ActiveRecord::Base
  has_many :datasheets, as: :datasheetable
  has_one :pinout, as: :pinoutable
  has_one :tubesocket, through: :pinout

  def tubesocket?
    if self.tubesocket
      return self.tubesocket.description
    else
      return "NA"
    end 
  end
end