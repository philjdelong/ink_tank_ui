class Image
  attr_reader :style, :url

  def initialize(style, url)
    @style = style
    @url = url
  end
end
