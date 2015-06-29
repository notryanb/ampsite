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
      Pinout.create(pinoutable_id: @triode.id, pinoutable_type: @triode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
      redirect_to preamps_path
    else
      render action: :new
    end
  end

  def show
    @triode = find_triode
    render 'show'
  end

  def edit
    @triode = find_triode
    @triode_fields = @triode.class
    render 'edit'
  end

  def update
    @triode = find_triode
    if @triode.update_attributes(triode_params)
      Pinout.create(pinoutable_id: @triode.id, pinoutable_type: @triode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
      redirect_to preamps_path
    else
      render action: :edit
    end
  end

  def destroy_confirm
    @triode = find_triode
    render 'destroy'
  end

  def destroy
    @triode = find_triode
    @triode.destroy
    redirect_to preamps_path
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

  def find_triode
    Triode.find_by(id: params[:id])
  end

end