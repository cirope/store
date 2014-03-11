require 'test_helper'

class StatesTest < ActionDispatch::IntegrationTest
  test 'should create a new state with cities' do
    login

    visit new_state_path
    fill_in_new_state

    add_city 'Media Agua', '5435', 1
    add_city 'Ullum', '5409', 2

    assert_difference 'State.count' do
      assert_difference 'City.count', 2 do
        find('.btn.btn-primary').click
      end
    end
  end

  test 'should remove state cities' do
    state = states :mendoza
    login

    visit edit_state_path(state)

    page.find('#cities fieldset:nth-child(1)').hover

    within '#cities fieldset:nth-child(1)' do
      find('a[data-dynamic-form-event="hideItem"]').click
    end

    assert_difference 'state.cities.count', -1 do
      find('.btn.btn-primary').click
    end
  end

  private

    def fill_in_new_state
      fill_in 'state_name', with: 'San Juan'
    end

    def add_city name, zip_code, index
      click_link I18n.t('states.new.city') if index > 1

      within "#cities fieldset:nth-child(#{index})" do
        fill_in find('input[name$="[name]"]')[:id], with: name
        fill_in find('input[name$="[zip_code]"]')[:id], with: zip_code
      end
    end
end
