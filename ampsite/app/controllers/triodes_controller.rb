class TriodesController < ApplicationController

  def new
    @triode = Triode.new
    @triode_fields = @triode.class
    render 'new'
  end

  def create
    @triode = Triode.new(triode_params)
    if @triode.save
      redirect_to preamps_path
    else
      render action: :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def triode_params
    params.require(:triode).permit(:identifier,
                                  :max_anode_voltage,
                                  :max_filament_cathode_voltage,
                                  :max_cathode_current,
                                  :anode_dissipation,
                                  :amplification_factor,
                                  :filament_voltage,
                                  :filament_current,
                                  :pinout,
                                  :description,
                                  :notes)
  end

end