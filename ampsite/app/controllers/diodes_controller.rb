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

  def show
    @diode = Diode.find_by(params[:id])
    render 'show'
  end

  def edit
    @diode = Diode.find_by(params[:id])
    render 'edit'
  end

  def update
    @diode = Diode.find_by(params[:id])
    if @diode.update_attributes(diode_params)
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy
    @diode = Diode.find_by(params[:id])
    @diode.destroy
    render 'rectifiers'
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