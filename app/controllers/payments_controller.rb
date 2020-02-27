class PaymentsController < ApplicationController

  def new
  end

  def create
    amount = (params[:amount].to_f * 100)
    raw_charge = Faraday.get("http://localhost:9292/payments") do |req|
      req.body = {title: "#{params[:title]}",
                description: "#{params[:description]}",
                amount: "#{amount}"}.to_json
    end

    charge = JSON.parse(raw_charge.body)
    redirect_to '/profile'
  end
end
