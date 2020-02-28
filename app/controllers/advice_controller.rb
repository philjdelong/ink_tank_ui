class AdviceController < ApplicationController
  def show
    advice = Faraday.get('http://localhost:9292/advice')
    @advice = JSON.parse(advice.body)
  end
end
