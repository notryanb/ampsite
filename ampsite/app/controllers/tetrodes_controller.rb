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
      create_pinout
      redirect_to powers_path
    else
      render action: :new
    end
  end

  def show
    @tetrode = find_tetrode
    render 'show'
  end

  def edit
    @tetrode = find_tetrode
    @tetrode_fields = @tetrode.class
    render 'edit'
  end

  def update
    @tetrode = find_tetrode
    @pinout = find_pinout
    if @tetrode.update_attributes(tetrode_params)
      @pinout ? update_pinout : create_pinout
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy_confirm
    @tetrode = find_tetrode
    render 'destroy'
  end

  def destroy
    @tetrode = find_tetrode
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

  def create_pinout
    Pinout.create(pinoutable_id: @tetrode.id, pinoutable_type: @tetrode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
  end

  def update_pinout
    @pinout.update_attributes(pinoutable_id: @tetrode.id, pinoutable_type: @tetrode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
  end

  def find_pinout
    Pinout.find_by(params[pinoutable_id: @tetrode.id])
  end

  def find_tetrode
    Tetrode.find_by(id: params[:id])
  end

end