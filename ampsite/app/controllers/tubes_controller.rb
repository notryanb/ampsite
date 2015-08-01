class TubesController < ApplicationController

    def index
      v = "<a href='http://www.google.com'>Link</a>"
      @test = "this is a test #{v}".html_safe
      render 'index'
    end


end