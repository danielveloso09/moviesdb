require 'rails_helper'

feature 'the home page', js: true do
  specify 'works' do
    visit '/'

    expect(page).to have_css('h1', text: 'List of all movies')

    click_on 'Create a movie'

    expect(page).to have_css('h1', text: 'New Movie')
  end
end
