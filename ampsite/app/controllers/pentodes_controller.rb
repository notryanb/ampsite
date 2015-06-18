class PentodesController < ApplicationController

  def new
    @pentode = Pentode.new
    @pentode_fields = @pentode.class
    render 'new'
  end

  def create
  end

  def update
  end

  def destroy
  end

end