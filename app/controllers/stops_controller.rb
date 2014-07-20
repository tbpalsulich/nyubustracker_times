class StopsController < ApplicationController
    def index
        @stops = Stop.all
    end
    def new
    end
    def create
        @stop = Stop.new(stop_params)

        @stop.save
        redirect_to stop_path(@stop.stop_id)
    end

    def show
        @stop = Stop.find(params[:id])
    end

    def destroy
        @stop = Stop.find(params[:id])
        @stop.destroy

        redirect_to stops_path
    end

    private
    def stop_params
        params.require(:stop).permit(:stop_id, :times)
    end
end
