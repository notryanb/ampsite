class TriodepentodesController < ApplicationController

  before_action :authorize!, except: [:show]

  def new
    @triodepentode = Triodepentode.new
    @triodepentode_fields = @triodepentode.class
    render 'new'
  end

  def create
    @triodepentode = Triodepentode.new(triodepentode_params)
    if @triodepentode.save
      redirect_to preamps_path
    else
      render action: :new
    end
  end

  def show
    @triodepentode = Triodepentode.find_by(id: params[:id])
    render 'show'
  end

  def edit
    @triodepentode = Triodepentode.find_by(id: params[:id])
    render 'edit'
  end

  def update
    @triodepentode = Triodepentode.find_by(id: params[:id])
    if @triodepentode.update_attributes(triodepentode_params)
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy
    @triodepentode = Triodepentode.find_by(params[:id])
    @triodepentode.destroy
    render 'preamps'
  end

  private

  def triodepentode_params
    params.require(:triodepentode).permit(:identifier,
                                  :max_triode_anode_voltage,
                                  :max_pentode_anode_voltage,
                                  :max_pentode_grid2_voltage,
                                  :max_triode_anode_dissipation,
                                  :max_pentode_anode_dissipation,
                                  :filament_voltage,
                                  :filament_current,
                                  :pinout,
                                  :description,
                                  :notes)
  end

end