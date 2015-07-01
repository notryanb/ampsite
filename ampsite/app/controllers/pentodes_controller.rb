class PentodesController < ApplicationController

  before_action :authorize!, except: [:show]

  def index
    @pentodes = Pentode.all
  end

  def new
    @pentode = Pentode.new
    @pentode_fields = @pentode.class
    render 'new'
  end

  def create
    @pentode = Pentode.new(pentode_params)
    if @pentode.save
      create_pinout
      redirect_to powers_path
    else
      render action: :new
    end
  end

  def show
    @pentode = find_pentode
    render 'show'
  end

  def edit
    @pentode = find_pentode
    @pentode_fields = @pentode.class
    render 'edit'
  end

  def update
    @pentode = find_pentode
    @pinout = find_pinout
    if @pentode.update_attributes(pentode_params)
      @pinout ? update_pinout : create_pinout
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy_confirm
    @pentode = find_pentode
    render 'destroy'
  end

  def destroy
    @pentode = find_pentode
    @pentode.destroy
    redirect_to powers_path
  end

  private

  def pentode_params
    params.require(:pentode).permit(:identifier,
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

  def find_pentode
    Pentode.find_by(id: params[:id])
  end

  def create_pinout
    Pinout.create(pinoutable_id: @pentode.id, pinoutable_type: @pentode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
  end

  def update_pinout
    @pinout.update_attributes(pinoutable_id: @pentode.id, pinoutable_type: @pentode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
  end

  def find_pinout
    Pinout.find_by(params[pinoutable_id: @pentode.id])
  end


end