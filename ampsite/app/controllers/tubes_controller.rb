class TubesController < ApplicationController

    def index
      render 'index'
    end

    def diode
      render 'diode'
    end

    def triode
      render 'triode'
    end

    def pentode 
      render 'pentode'
    end

end