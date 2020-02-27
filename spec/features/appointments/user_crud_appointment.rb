require 'rails_helper'

describe 'As a user' do
  before :each do
    token = ENV['GOOGLE_TOKEN']
    shop = Shop.create( name: 'Tattood',
                        street_address: '1331 17th Street',
                        city: 'Denver',
                        zip: '80202',
                        phone_number: '432535277')
    @user = User.create( name: 'Stevo',
                        tattoo_styles: 'Black and White',
                        price_per_hour: 100,
                        bio: 'Tattoo artist all day every day',
                        shop_id: shop.id
                        )


  end

  it 'I can create an appointment with a client' do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit user_path(@user.id)
    expect(current_path).to eq("/users/#{@user.id}")

    click_link 'Appointments'
    expect(current_path).to eq(users_appointments_path)

    click_link '2020-02-25'
    expect(current_path).to eq(users_appointments_path)
    # expect(current_path).to eq(users_appointment_path('2020-02-25', format: :js))

    find('#new-desc', match: :first).set('Initial consult')

    # fill_in 'new-desc', with: 'Initial consult'
    click_button 'Add Appointment'

    expect(current_path).to eq(users_appointments_path)

    appointment = Appointment.last
    expect(appointment.date).to eq('2020-02-25')
    expect(appointment.description).to eq('Initial consult')
  end

  xit 'I can view an appointment with a client' do

  end
end
