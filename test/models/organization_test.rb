require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @organization = organizations :cirope_sa
  end

  test 'blank attributes' do
    @organization.account = nil

    assert @organization.invalid?
    assert_error @organization, :account, :blank
  end

  test 'search' do
    organizations = Organization.search query: @organization.name

    assert organizations.present?
    assert organizations.all? { |o| o.name =~ /#{@organization.name}/ }
  end

  test 'empty search' do
    organizations = Organization.search query: 'empty search'

    assert organizations.empty?
  end
end
