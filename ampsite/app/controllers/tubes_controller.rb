class TubesController < ApplicationController

    def index
      render 'index'
    end

    def rectifiers
      @diodes = Diode.all
      render 'rectifiers'
    end

    def preamps
      @triodes = Triode.all
      render 'preamps'
    end

    def preamp
      @triode = Triode.find_by(params[:id])
      render 'preamp_show'
    end

    def pentodes
      render 'pentode'
    end

end