require 'test_helper'

class OrganizationsTest < ActionDispatch::IntegrationTest
  test 'add city' do
    login

    visit new_organization_path

    find("a[href='#{new_city_path}']").click

    within '#modal' do
      fill_in_new_city
    end

    assert_difference 'City.count' do
      find('#modal .btn.btn-primary').click
      assert page.has_no_css?('#modal')
    end

    assert page.has_css?('select[name$="[city_id]"] option[selected]', text: 'Guaymallén')
  end

  private

    def fill_in_new_city
      fill_in 'city_name', with: 'Guaymallén'
      fill_in 'city_zip_code', with: '5519'
      select states(:mendoza).name, from: 'city_state_id'
    end
end
