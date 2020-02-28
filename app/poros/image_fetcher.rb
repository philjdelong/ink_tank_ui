class ImageFetcher

  def get_single_images(current_user)
    styles = Style.where(id: current_user.artist_styles.pluck(:style_id).uniq).pluck(:name)
    images = styles.map do |style|
      image = GoogleSearchResults.new(q: "tattoo #{style}", tbm: "isch", serp_api_key: ENV['SERP_API_KEY'])
      image_results_list = image.get_hash[:images_results]
      Image.new(style, image_results_list[3][:original])
    end
  end
end
