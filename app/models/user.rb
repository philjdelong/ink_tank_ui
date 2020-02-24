class User < ApplicationRecord
  belongs_to :shop, optional: true
  #
  # validates_presence_of :name
  # validates_presence_of :tattoo_styles
  # validates_presence_of :price_per_hour
  # validates_presence_of :bio

  def self.update_user(user_info, current_user)
    current_user.uid = user_info[:uid]
    current_user.token = user_info[:credentials][:token]
    current_user.login = user_info[:extra][:raw_info][:login]
    current_user.save
  end

  def self.create_user(user_info)
    User.create!( uid:     user_info[:uid],
                  uid:     user_info[:uid],
                  token:   user_info[:credentials][:token],
                  login:   user_info[:extra][:raw_info][:login])
  end

  def update_user_shop(user, shop_id)
    user.update(shop_id: shop_id)
  end

  def complete_user(current_user, params)
    current_user.name  = params[:user][:name]
    current_user.bio   = params[:user][:bio]
    current_user.tattoo_styles   = params[:user][:tattoo_styles]
    current_user.price_per_hour  = params[:user][:price_per_hour].to_f
    current_user.save!
  end
end
