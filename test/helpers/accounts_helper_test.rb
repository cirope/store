require 'test_helper'

class AccountsHelperTest < ActionView::TestCase
  test 'admin subdomain' do
    assert !admin_subdomain?

    env['HTTP_HOST'] = "#{RESERVED_SUBDOMAINS.first}.lvh.me"

    assert admin_subdomain?
  end

  private

    def request
      ActionDispatch::TestRequest.new env
    end

    def env
      @_env ||= { 'HTTP_HOST' => 'test.lvh.me' }
    end
end
