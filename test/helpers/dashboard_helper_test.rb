require 'test_helper'

class DashboardHelperTest < ActionView::TestCase
  test 'dashboard for' do
    account = accounts :cirope

    assert_match /#{account.subdomain}/, dashboard_for(account)
  end
end
