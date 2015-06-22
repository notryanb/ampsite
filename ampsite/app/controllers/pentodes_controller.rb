class PentodesController < ApplicationController

  before_action :authorize!, only: [:new, :create, :update, :edit, :destroy]

  def new
    @pentode = Pentode.new
    @pentode_fields = @pentode.class
    render 'new'
  end

  def create
    @pentode = Pentode.new(pentode_params)
    if @pentode.save
      redirect_to powers_path
    else
      render action: :new
    end
  end

  def show
    @pentode = Pentode.find_by(id: params[:id])
    render 'show'
  end

  def edit
    @pentode = Pentode.find_by(id: params[:id])
    render 'edit'
  end

  def update
    @pentode = Pentode.find_by(id: params[:id])
    if @pentode.update_attributes(pentode_params)
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy
    @pentode = Pentode.find_by(id: params[:id])
    @pentode.destroy
    render 'powers'
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

end