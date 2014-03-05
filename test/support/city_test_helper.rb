module CityTestHelper
  def add_city
    find("a[href='#{new_city_path}']").click

    fill_in_new_city

    assert_difference 'City.count' do
      find('form.new_city .btn.btn-primary').click
      assert page.has_no_css?('form.new_city')
    end

    assert page.has_css?('select[name$="[city_id]"] option[selected]', text: 'Villa Mercedes')
  end

  def fill_in_new_city
    fill_in 'city_name', with: 'Villa Mercedes'
    fill_in 'city_zip_code', with: '5730'

    add_state
  end

  def add_state
    find("a[href='#{new_state_path}']").click

    fill_in 'state_name', with: 'San Luis'

    assert_difference 'State.count' do
      find('form.new_state .btn.btn-primary').click
      assert page.has_no_css?('form.new_state')
    end

    assert page.has_css?('select[name$="[state_id]"] option[selected]', text: 'San Luis')
  end
end
