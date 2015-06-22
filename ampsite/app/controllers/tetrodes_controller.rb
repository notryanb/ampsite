class TetrodesController < ApplicationController

  before_action :authorize!

  def new
    @tetrode = Tetrode.new
    @tetrode_fields = @tetrode.class
    render 'new'
  end

  def create
    @tetrode = Tetrode.new(tetrode_params)
    if @tetrode.save
      redirect_to powers_path
    else
      render action: :new
    end
  end

  def show
    @tetrode = Tetrode.find_by(params[:id])
    render 'show'
  end

  def edit
    @tetrode = Tetrode.find_by(params[:id])
    render 'edit'
  end

  def update
    @tetrode = Tetrode.find_by(params[:id])
    if @tetrode.update_attributes(tetrode_params)
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy
    @tetrode = Tetrode.find_by(params[:id])
    @tetrode.destroy
    render 'powers'
  end

  private

  def tetrode_params
    params.require(:tetrode).permit(:identifier,
                                  :max_anode_voltage,
                                  :max_grid2_voltage,
                                  :max_anode_dissipation,
                                  :max_grid2_dissipation,
                                  :max_cathode_current,
                                  :filament_voltage,
                                  :filament_current,
                                  :pinout,
                                  :description,
                                  :notes)
  end

end