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
        redirect_to stop_path(@stop.stop_id)
    end

    def update 
        @stop = Stop.find(params[:id])
        logger.info(params.inspect)
         
        if @stop.update(stop_params)
            redirect_to stop_path(@stop.stop_id)
        else
            render 'edit'
        end
    end

    def edit
        @stop = Stop.find(params[:id])
        gon.stop_times = @stop.times
    end

    def show
        @stop = Stop.find(params[:id])
        gon.stop_times = @stop.times
        respond_to do |format|
            format.html
            format.json { render :json => @stop.times }
        end
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
