class TubesController < ApplicationController

    def index
      render 'index'
    end

    def rectifiers
      @diodes = Diode.all
      render 'rectifiers'
    end

    def preamps
      @preamps = Triode.all + Triodepentode.all
      render 'preamps'
    end

    def preamp
      @triode = Triode.find_by(params[:id])
      render 'preamp_show'
    end

    def powers
      @powers = Tetrode.all + Pentode.all
      render 'powers'
    end

end