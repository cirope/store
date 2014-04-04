module CommodityTestHelper
  def add_new_commodity prefix: ''
    find("a[href='#{new_commodity_path}']").click

    within '#modal' do
      fill_in_new_commodity
    end

    assert find_field("#{prefix}_attributes_0_commodity").value.blank?

    assert_difference 'Commodity.count' do
      find('#modal .btn.btn-primary').click
      assert page.has_no_css?('#modal')
    end

    assert find_field("#{prefix}_attributes_0_commodity").value.present?
  end

  def fill_in_new_commodity
    fill_in find('input[name$="[code]"]')[:id], with: '321'
    fill_in find('input[name$="[name]"]')[:id], with: 'Chocolate'
    fill_in find('input[name$="[price]"]')[:id], with: '12,34'
    fill_in find('input[name$="[unit]"]')[:id], with: 'piece'
  end
end
