require 'rails_helper'

feature 'the home page' do
  specify 'works' do
    visit '/'

    current_user = FactoryBot.create :user, admin: 't'
    fill_in 'user_email', :with => current_user.email
    fill_in 'user_password', :with => current_user.password

    click_on 'Log in'

    expect(page).to have_css('h1', text: 'List of all movies')

    click_on 'Create a movie'

    expect(page).to have_css('h1', text: 'New Movie')
  end
end
