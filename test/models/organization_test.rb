require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @organization = organizations :cirope_sa
  end

  test 'blank attributes' do
    @organization.name = ''
    @organization.account = nil

    assert @organization.invalid?
    assert_error @organization, :name, :blank
    assert_error @organization, :account, :blank
  end

  test 'unique attributes' do
    organization = Organization.new @organization.dup.attributes

    assert organization.invalid?
    assert_error organization, :name, :taken
  end

  test 'attributes length' do
    @organization.name = 'abcde' * 52

    assert @organization.invalid?
    assert_error @organization, :name, :too_long, count: 255
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
