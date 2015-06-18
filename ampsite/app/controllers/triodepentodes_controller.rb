class TriodepentodesController < ApplicationController

  def new
    @triodepentode = Triodepentode.new
    @triodepentode_fields = @triodepentode.class
    render 'new'
  end

  def create
  end

  def update
  end

  def destroy
  end

end