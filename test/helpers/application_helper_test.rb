require 'test_helper'
require 'minitest/mock'

class ApplicationHelperTest < ActionView::TestCase
  test 'title' do
    @title = 'test page'

    assert_equal [I18n.t('app_name'), @title].join(' | '), title
  end

  test 'remote if xhr' do
    request!
    request.expect :xhr?, true

    assert_equal({ remote: true }, remote_if_xhr)
    assert request.verify

    request!
    request.expect :xhr?, false

    assert_nil remote_if_xhr
    assert request.verify
  end

  test 'shallow args' do
    child = MiniTest::Mock.new

    child.expect :new_record?, false

    assert_equal child.object_id, shallow_args('Parent', child).object_id

    child.expect :new_record?, true

    assert_equal ['Parent', child], shallow_args('Parent', child)
  end

  private

    def request
      @_request ||= MiniTest::Mock.new
    end

    def request!
      @_request = nil
      request
    end
end
