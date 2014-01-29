require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  include EntitiesTestHelper

  test 'should create a new user with relations' do
    login

    visit new_user_path
    fill_in_new_user

    add_organization organizations(:cirope_sa), 1
    add_organization organizations(:cirope_inc), 2

    assert_difference 'User.count' do
      assert_difference 'Relation.count', 2 do
        find('.btn.btn-primary').click
      end
    end
  end

  test 'should remove user relations' do
    user = users(:franco)
    user.relations.create! organization_id: Organization.create!(generic_entity_attributes).id
    login

    visit edit_user_path(user)

    page.find('#relations fieldset:nth-child(1)').hover

    within '#relations fieldset:nth-child(1)' do
      find('a[data-dynamic-form-event="hideItem"]').click
    end

    assert_difference 'user.relations.count', -1 do
      find('.btn.btn-primary').click
    end
  end

  private

    def fill_in_new_user
      fill_in 'user_name', with: 'Anakin'
      fill_in 'user_lastname', with: 'Skywalker'
      fill_in 'user_email', with: 'anakin@sw.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
    end

    def add_organization organization, index
      click_link I18n.t('users.new.relation') if index > 1

      within "#relations fieldset:nth-child(#{index})" do
        input_id = find('input[name$="[organization]"]')[:id]
        page.execute_script "$('##{input_id}').focus().val('#{organization.name}').keydown()"
      end

      find('.ui-autocomplete li.ui-menu-item').click
    end
end
