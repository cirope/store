module CommodityTestHelper
  def add_new_commodity type: Item, prefix: ''
    find("a[href='#{new_commodity_path}']").click

    within '#modal' do
      if type == Item
        fill_in_new_item
      else
        click_link Service.model_name.human(count: 1)
        assert page.has_css?('form.new_service')

        fill_in_new_service
      end
    end

    assert find_field("#{prefix}_attributes_0_commodity").value.blank?

    assert_difference ['Commodity.count', "#{type.name}.count"] do
      find('#modal .btn.btn-primary').click
      assert page.has_no_css?('#modal')
    end

    assert find_field("#{prefix}_attributes_0_commodity").value.present?
  end

  private

    def fill_in_new_item
      fill_in find('input[name$="[code]"]')[:id], with: '321'
      fill_in find('input[name$="[name]"]')[:id], with: 'Chocolate'
      fill_in find('input[name$="[price]"]')[:id], with: '12,34'
      fill_in find('input[name$="[unit]"]')[:id], with: 'piece'
    end

    def fill_in_new_service
      fill_in find('input[name$="[name]"]')[:id], with: 'Packaging'
      fill_in find('input[name$="[price]"]')[:id], with: '1,29'
    end
end
