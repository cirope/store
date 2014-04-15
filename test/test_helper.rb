ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'sidekiq/testing/inline'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  setup do
    Account.current_id = accounts(:cirope).id
  end

  def assert_error model, attribute, type, options = {}
    assert model.errors[attribute].include?(
      model.errors.generate_message(attribute, type, options)
    )
  end
end

class ActionController::TestCase
  def login user: users(:franco), account: accounts(:cirope)
    Account.current_id = account.id
    @request.host = "#{account.subdomain}.lvh.me"
    cookies.encrypted[:auth_token] = user.auth_token
  end
end

class ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper
end

# Custom extensions
require_relative 'support/city_test_helper'
require_relative 'support/entities_test_helper'
require_relative 'support/integration_test'
require_relative 'support/commodity_test_helper'
require_relative 'support/shared_db_connection'
