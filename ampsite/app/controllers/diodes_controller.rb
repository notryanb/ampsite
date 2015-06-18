class DiodesController < ApplicationController

  def new
    @diode = Diode.new
    @diode_fields = @diode.class
    render 'new'
  end

  def create
  end

  def update
  end

  def destroy
  end

end