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

    def pentodes
      render 'pentode'
    end

end