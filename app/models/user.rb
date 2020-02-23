class User < ApplicationRecord
  belongs_to :shop

  def update_user(user_info, current_user)
    current_user.uid = user_info[:uid]
    current_user.token = user_info[:credentials][:token]
    current_user.login = user_info[:extra][:raw_info][:login]
    current_user.save
  end

  def self.create_user(user_info)
    shop = Shop.first
    User.create!( uid:     user_info[:uid],
                  shop_id: shop.id,
                  uid:     user_info[:uid],
                  token:   user_info[:credentials][:token],
                  login:   user_info[:extra][:raw_info][:login])
  end

  def complete_user(params)
    require "pry"; binding.pry
  end
end
