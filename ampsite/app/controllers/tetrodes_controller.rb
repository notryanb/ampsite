class TetrodesController < ApplicationController

  def new
    @tetrode = Tetrode.new
    @tetrode_fields = @tetrode.class
    render 'new'
  end

  def create
  end

  def update
  end

  def destroy
  end

end