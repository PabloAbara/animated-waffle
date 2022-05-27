class HomeController < ApplicationController
  def index
    if params[:ticker] == ""
      @nothing = "Hey!! Olvidaste ingresar algo!!!"
    elsif params[:ticker]
      begin
        @api = StockQuote::Stock.new(api_key: 'pk_301ccdd175754c76a67f435c41f4ccde')
        @stock= StockQuote::Stock.quote(params[:ticker], @api)
      rescue => exception
        puts exception
        @error = "ERROR, no eziste perretz"
      end
    end
  end

  def about
  end
end