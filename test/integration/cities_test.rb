require 'test_helper'

class CitiesTest < ActionDispatch::IntegrationTest
  test 'add state' do
    login

    visit new_city_path

    find("a[href='#{new_state_path}']").click

    within 'form.new_state' do
      fill_in 'state_name', with: 'San Juan'
    end

    assert_difference 'State.count' do
      find('.btn.btn-primary').click
      assert page.has_no_css?('form.new_state')
    end

    assert page.has_css?('select[name$="[state_id]"] option[selected]', text: 'San Juan')
  end
end
