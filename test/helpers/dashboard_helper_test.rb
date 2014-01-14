require 'test_helper'

class DashboardHelperTest < ActionView::TestCase
  test 'dashboard for' do
    organization = organizations :cirope

    assert_match /#{organization.subdomain}/, dashboard_for(organization)
  end
end
