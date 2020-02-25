class Appointment < ApplicationRecord
  validates_presence_of :date,
                        :description
                        # :paid,
                        # :client_name,
                        # :client_email,
                        # :user_id
end
