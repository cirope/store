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

  def set_current_organization organization = organizations(:cirope)
    Organization.current_id = organization.id
  end
end

class ActionController::TestCase
  def login
    cookies.encrypted[:auth_token] = users(:franco).auth_token
  end
end

class ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper
end

# Custom extensions
require_relative 'extensions/integration_test'
