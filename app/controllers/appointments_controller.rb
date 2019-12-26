class AppointmentsController < ApplicationController

      def index
        puts current_user.name
        puts current_user.id
        @appointments = Appointment.where(user_id: current_user.id) 
      end
    
      def new
        @appointment = Appointment.new
      end

      def show
        @appointment = Appointment.find(params[:id])
      end

      def destroy
        Appointment.find(params[:id]).destroy
        respond_to do |format|
          format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
      

      def create
        param=appointment_params.merge :user_id => current_user.id 
        @appointment = Appointment.new(param)
    
        respond_to do |format|
          if @appointment.save
            format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
            format.json { render :show, status: :created, location: @appointment }
          else
            format.html { render :new }
            format.json { render json: @appointment.errors, status: :unprocessable_entity }
          end
        end
      end

      def edit
        @appointment = Appointment.find(params[:id])
      end

      def update
        appointment = Appointment.find(params[:id])
        appointment.update(params.require(:appointment).permit(:date, :time, :barber_id, :user_id))
          
        redirect_to appointment
      end
      
      def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :time, :barber_id)
    end
    
end
