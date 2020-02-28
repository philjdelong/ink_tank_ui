class StylesController < ApplicationController

   def index
      @styles = Style.all
   end

   def show
      @style = Style.find(params[:id])
      return @images if @images
      image_service = GoogleSearchResults.new(q: "tattoo #{ @style.name }", tbm: "isch", serp_api_key: ENV['SERP_API_KEY'])
      @images = image_service.get_hash[:images_results][0..29]
   end
end