ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  def assert_error model, attribute, type, options = {}
    assert model.errors[attribute].include?(
      model.errors.generate_message(attribute, type, options)
    )
  end

  def set_current_account account = accounts(:cirope)
    Account.current_id = account.id
  end

  def unscoped_user user
    User.unscoped.scoping { users user }
  end
end

class ActionController::TestCase
  def login user: unscoped_user(:franco), account: accounts(:cirope)
    @request.host = "#{account.subdomain}.lvh.me"
    cookies.encrypted[:auth_token] = user.auth_token
  end
end

class ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper
end

# Custom extensions
require_relative 'extensions/integration_test'
