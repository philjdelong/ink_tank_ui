class Appointment < ApplicationRecord
  belongs_to :artist

  validates_presence_of :date,
                        :description
                        # :paid,
                        # :client_name,
                        # :client_email,
                        # :user_id
end
