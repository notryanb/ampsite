class TriodesController < ApplicationController

  def new
    @triode = Triode.new
    @fields = @triode.class
    render 'new'
  end

  def create
  end

  def update
  end

  def destroy
  end

end