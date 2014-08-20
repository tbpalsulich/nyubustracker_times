class StopsController < ApplicationController
    def index
        @stops = Stop.order("stop_name ASC").all
        gon.stops = @stops
        respond_to do |format|
            format.html
            format.js
        end
    end

    def new
    end

    def create
        @stop = Stop.new(stop_params)
        @stop.save
        redirect_to stops_path
    end

    def destroy
        @stop = Stop.find(params[:id])
        @stop.destroy

        redirect_to stops_path
    end

    private
    def stop_params
        params.require(:stop).permit(:stop_name, :stop_id, :times)
    end
end
