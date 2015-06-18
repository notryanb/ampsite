class DiodesController < ApplicationController

  def new
    @diode = Diode.new
    @diode_fields = @diode.class
    render 'new'
  end

  def create
    @diode = Diode.new(diode_params)
    if @diode.save
      redirect_to rectifiers_path
    else
      render action: :new
    end
  end

  def update
  end

  def destroy
  end

private
  
  def diode_params
    params.require(:diode).permit(:identifier,
                                  :max_peak_inverse_voltage,
                                  :voltage_drop,
                                  :rectifier_class,
                                  :filament_voltage,
                                  :filament_current,
                                  :pinout,
                                  :description,
                                  :notes)
  end

end