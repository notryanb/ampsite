class DiodesController < ApplicationController

  before_action :authorize!, except: [:show]

  def new
    @diode = Diode.new
    @diode_fields = @diode.class
    render 'new'
  end

  def create
    @diode = Diode.new(diode_params)
    if @diode.save
      Pinout.create(pinoutable_id: @diode.id, pinoutable_type: @diode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
      redirect_to rectifiers_path
    else
      render action: :new
    end
  end

  def show
    @diode = Diode.find_by(id: params[:id])
    render 'show'
  end

  def edit
    @diode = Diode.find_by(id: params[:id])
    @diode_fields = @diode.class
    render 'edit'
  end

  def update
    @diode = Diode.find_by(id: params[:id])
    if @diode.update_attributes(diode_params)
      Pinout.create(pinoutable_id: @diode.id, pinoutable_type: @diode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy_confirm
    @diode = Diode.find_by(id: params[:id])
    render 'destroy'
  end

  def destroy
    @diode = Diode.find_by(id: params[:id])
    @diode.destroy
    redirect_to rectifiers_path
  end

  def add_datasheet
  end

private
  
  def diode_params
    params.require(:diode).permit(:identifier,
                                  :max_peak_inverse_voltage,
                                  :voltage_drop,
                                  :rectifier_class,
                                  :filament_voltage,
                                  :filament_current,
                                  :rms_anode_to_anode,
                                  :description,
                                  :notes)
  end

end