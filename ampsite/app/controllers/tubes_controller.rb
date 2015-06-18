class TubesController < ApplicationController

    def index
      render 'index'
    end

    def diodes
      render 'diode'
    end

    def triodes
      @triodes = Triode.all
      render 'triode'
    end

    def triode
      @triode = Triode.find_by(params[:id])
      render 'triode_show'
    end
    
    def pentodes
      render 'pentode'
    end

end