class PinoutsController < ApplicationController

  before_action :authorize!

  def new
    @pinout = Pinout.new
    @pinout_fields = @pinout.class
    render 'new'
  end

  def create
    @pinout = Pinout.new(pinout_params)
    if @pinout.save
      redirect_to users_path
    else
      render action: :new
    end
  end

  def show
    @pinout = Pinout.find_by(id: params[:id])
    render 'show'
  end

  def edit
    @pinout = Pinout.find_by(id: params[:id])
    render 'edit'
  end

  def update
    @pinout = Pinout.find_by(id: params[:id])
    if @pinout.update_attributes(pinout_params)
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy
    @pinout = Pinout.find_by(id: params[:id])
    @pinout.destroy
    render 'powers'
  end

  private

  def pinout_params
    params.require(:tetrode).permit(:description,
                                    :pin_1,
                                    :pin_2,
                                    :pin_3,
                                    :pin_4,
                                    :pin_5,
                                    :pin_6,
                                    :pin_7,
                                    :pin_8,
                                    :pin_9,
                                    :identifier)
  end

end