class TubesocketsController < ApplicationController

  before_action :authorize!

  def new
    @tubesocket = Tubesocket.new
    @tubesocket_fields = @tubesocket.class
    render 'new'
  end

  def create
    @tubesocket = Tubesocket.new(tubesocket_params)
    if @tubesocket.save
      redirect_to users_path
    else
      render action: :new
    end
  end

  def show

  end

  def edit
    @tubesocket = Tubesocket.find_by(id: params[:id])
    render 'edit'
  end

  def update
    @tubesocket = Tubesocket.find_by(id: params[:id])
    if @tubesocket.update_attributes(tubesocket_params)
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy
    @tubesocket = Tubesocket.find_by(id: params[:id])
    @tubesocket.destroy
    render 'powers'
  end

  private

  def tubesocket_params
    params.require(:tubesocket).permit(:description,
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