class TimesController < ApplicationController
    def show
        @stop = Stop.find(params[:stop_id])
        logger.info params[:id]
        logger.info "Format: #{:format}"
        respond_to do |format|
            logger.info "Format: #{format}"
            format.json { render :json => @stop.times }
        end
    end
end
