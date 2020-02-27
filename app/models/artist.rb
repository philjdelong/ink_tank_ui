class Artist < ApplicationRecord

  has_many :artist_styles
  has_many :artists, through: :artist_styles

  validates_presence_of :uid, on: :create
  validates_presence_of :login, on: :create
  validates_presence_of :token, on: :create
  validates_presence_of :name, on: :update
  validates_presence_of :price_per_hour, on: :update
  validates_presence_of :bio, on: :update

  def self.update_user(user_info, current_user)
    current_user.uid = user_info[:uid]
    current_user.token = user_info[:credentials][:token]
    current_user.login = user_info[:info][:email]
    current_user.image = user_info[:info][:image]
    current_user.save
  end

  def self.save_user_oauth_info(user_info)
    Artist.create!( uid:   user_info[:uid],
                  token: user_info[:credentials][:token],
                  login: user_info[:info][:email],
                  image: user_info[:info][:image])
  end

  def update_user_shop(user, shop_id)
    user.update(shop_id: shop_id)
  end

  def complete_user(current_user, params)
    current_user.name  = params[:artist][:name]
    current_user.bio   = params[:artist][:bio]
    current_user.price_per_hour  = params[:artist][:price_per_hour].to_f
    current_user.save!
    Style.add_user_styles(current_user, params)
  end
end
