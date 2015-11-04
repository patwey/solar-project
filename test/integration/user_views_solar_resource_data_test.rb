require 'test_helper'

class UserViewsSolarResourceDataTest < ActionDispatch::IntegrationTest
  test 'user can see solar resource data for city' do
    visit root_path
    fill_in 'Address', with: 'Pittsburgh, PA'
    click_button 'Retrieve Data'

    assert page.has_content?('Pittsburgh, PA')
  end
end
