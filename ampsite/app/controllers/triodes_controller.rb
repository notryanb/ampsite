class TriodesController < ApplicationController

  before_action :authorize!, except: [:show]

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

  def show
    @triode = Triode.find_by(id: params[:id])
    render 'show'
  end

  def edit
    @triode = Triode.find_by(id: params[:id])
    render 'edit'
  end

  def update
    @triode = Triode.find_by(id: params[:id])
    if @triode.update_attributes(triode_params)
      render preamps_path
    else
      render action: :edit
    end
  end

  def destroy
    @triode = Triode.find_by(id: params[:id])
    @triode.destroy
    render 'preamps'
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