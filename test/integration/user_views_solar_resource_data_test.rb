require 'test_helper'

class UserViewsSolarResourceDataTest < ActionDispatch::IntegrationTest
  test 'user can see solar resource data for valid address' do
    visit root_path
    fill_in 'Address', with: 'Pittsburgh, PA'
    click_button 'Retrieve Data'

    assert page.has_content?('Pittsburgh, PA')
  end

  test 'user cannot see solar resource data for invalid address' do
    visit root_path
    fill_in 'Address', with: 'INVALIDADDRESS'
    click_button 'Retrieve Data'

    assert page.has_content?('Data does not exist for that address')
  end
end
