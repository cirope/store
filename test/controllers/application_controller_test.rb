require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  setup do
    @controller.send 'response=', @response
    @controller.send 'request=', @request
  end

  test 'should current user be nil' do
    assert_nil current_user
  end

  test 'should load current user when auth_token is present' do
    login

    assert_not_nil current_user
  end

  test 'should current organization be nil' do
    assert_nil current_organization
  end

  test 'should load current organization when subdomain is present' do
    cirope = organizations(:cirope)
    @request.host = "#{cirope.subdomain}.lvh.me"

    assert_equal cirope, current_organization
  end

  test 'should not found current organization when subdomain is wrong' do
    @request.host = 'wrong.lvh.me'

    assert_raises(ActiveRecord::RecordNotFound) { current_organization }
  end

  test 'should redirect when there is no current user' do
    authorize

    assert_redirected_to login_url
  end

  test 'should not redirect when current user' do
    login
    authorize

    assert_nil @response.location
  end

  private

  def current_user
    @controller.send(:current_user)
  end

  def current_organization
    @controller.send(:current_organization)
  end

  def authorize
    @controller.send(:authorize)
  end
end
