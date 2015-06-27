class TetrodesController < ApplicationController

  before_action :authorize!, except: [:show]

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
    @tetrode = Tetrode.find_by(id: params[:id])
    render 'show'
  end

  def edit
    @tetrode = Tetrode.find_by(id: params[:id])
    @tetrode_fields = @tetrode.class
    render 'edit'
  end

  def update
    @tetrode = Tetrode.find_by(id: params[:id])
    Pinout.create(pinoutable_id: @tetrode.id, pinoutable_type: @tetrode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
    if @tetrode.update_attributes(tetrode_params)
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy_confirm
    @tetrode = Tetrode.find_by(id: params[:id])
    render 'destroy'
  end

  def destroy
    @tetrode = Tetrode.find_by(id: params[:id])
    @tetrode.destroy
    redirect_to powers_path
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