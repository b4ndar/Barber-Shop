class BarbersController < ApplicationController
  before_action :set_barber, only: [:show, :edit, :update, :destroy]

  # GET /barbers
  # GET /barbers.json
  def index
    @barbers = Barber.all
  end

  # GET /barbers/1
  # GET /barbers/1.json
  def show
  end

  # GET /barbers/new
  def new
    @barber = Barber.new
  end

  # GET /barbers/1/edit
  def edit
  end

  
  def create
    @barber = Barber.new(barber_params)
      if @barber.save
        redirect_to @barber, notice: 'Barber was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @barber.update(barber_params)
       redirect_to @barber, notice: 'Barber was successfully updated.'
      else
       render json: @barber.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @barber.destroy
     redirect_to barbers_url, notice: 'Barber was successfully destroyed.'
    end
  end

  private

    def set_barber
      @barber = Barber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barber_params
      params.require(:barber).permit(:name, :raing, :phone)
    end
end
