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
          redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
        end
      
      

      def create
        param=appointment_params.merge :user_id => current_user.id 
        @appointment = Appointment.new(param)
          if @appointment.save
             redirect_to @appointment, notice: 'Appointment was successfully created.' 
          else
            render json: @appointment.errors, status: :unprocessable_entity 
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
