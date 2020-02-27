class PaymentsController < ApplicationController

  def new
    @amount = (params[:amount].to_f * 100).to_i
  end
end
