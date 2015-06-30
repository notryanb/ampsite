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
      create_pinout
      redirect_to preamps_path
    else
      render action: :new
    end
  end

  def show
    @triodepentode = find_triodepentode
    render 'show'
  end

  def edit
    @triodepentode = find_triodepentode
    @triodepentode_fields = @triodepentode.class
    render 'edit'
  end

  def update
    @triodepentode = find_triodepentode
    pinout = find_pinout
    if @triodepentode.update_attributes(triodepentode_params)
      if pinout
        update_pinout
      else
        create_pinout
      end
      render 'show'
    else
      render action: :edit
    end
  end

  def destroy_confirm
    @triodepentode = find_triodepentode
    render 'destroy'
  end

  def destroy
    @triodepentode = find_triodepentode
    @triodepentode.destroy
    redirect_to preamps_path
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

  def create_pinout
    Pinout.create(pinoutable_id: @triodepentode.id, pinoutable_type: @triodepentode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
  end

  def update_pinout
    pinout.update_attributes(pinoutable_id: @triodepentode.id, pinoutable_type: @triodepentode.class, tubesocket_id: params[:tubesocket][:tubesocket_id] )
  end

  def find_pinout
    Pinout.find_by(params[pinoutable_id: @triodepentode.id])
  end

  def find_triodepentode
    Triodepentode.find_by(id: params[:id])
  end

end