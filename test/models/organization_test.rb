require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @organization = organizations(:cirope)
  end

  test 'blank attributes' do
    @organization.name = ''
    @organization.subdomain = ''

    assert @organization.invalid?
    assert_error @organization, :name, :blank
    assert_error @organization, :subdomain, :blank
  end

  test 'unique attributes' do
    @organization.name = organizations(:iso).name
    @organization.subdomain = organizations(:iso).subdomain

    assert @organization.invalid?
    assert_error @organization, :name, :taken
    assert_error @organization, :subdomain, :taken
  end

  test 'attributes length' do
    @organization.name = 'abcde' * 52
    @organization.subdomain = 'abcde' * 52

    assert @organization.invalid?
    assert_error @organization, :name, :too_long, count: 255
    assert_error @organization, :subdomain, :too_long, count: 255
  end

  test 'subdomain format' do
    @organization.subdomain = 'bad subdomain?'

    assert @organization.invalid?
    assert_error @organization, :subdomain, :invalid
  end

  test 'subdomain downcase and strip' do
    @organization.subdomain = ' IRAM '

    assert @organization.valid?
    assert_equal 'iram', @organization.subdomain
  end

  test 'subdomain exclusion' do
    @organization.subdomain = RESERVED_SUBDOMAINS.first

    assert @organization.invalid?
    assert_error @organization, :subdomain, :exclusion
  end

  test 'current' do
    Organization.current_id = @organization.id

    assert_equal @organization.id, Organization.current_id

    Thread.new { assert_nil Organization.current_id }
  end

  test 'by subdomain scope' do
    found = Organization.by_subdomain @organization.subdomain

    assert_equal @organization, found
    assert_nil Organization.by_subdomain(RESERVED_SUBDOMAINS.first)
    assert_raises ActiveRecord::RecordNotFound do
      Organization.by_subdomain 'wrong'
    end
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
