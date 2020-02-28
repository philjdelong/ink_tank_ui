class AdviceController < ApplicationController
  def show
    advice = Faraday.get('https://ink-tank-be.herokuapp.com')
    @advice = JSON.parse(advice.body)
  end
end
