class Style < ApplicationRecord
  has_many :user_styles
  has_many :users, through: :user_styles
  validates_presence_of :name
  validates_presence_of :description

  def self.add_user_styles(current_user, params)
    params["style_ids"].each do |id|
      UserStyle.create(user_id: current_user.id, style_id: id)
    end
  end
end
