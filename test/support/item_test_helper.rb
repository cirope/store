module ItemTestHelper
  def add_new_item prefix: ''
    find("a[href='#{new_item_path}']").click

    within '#modal' do
      fill_in_new_item
    end

    assert find_field("#{prefix}_attributes_0_item").value.blank?

    assert_difference 'Item.count' do
      find('#modal .btn.btn-primary').click
      assert page.has_no_css?('#modal')
    end

    assert find_field("#{prefix}_attributes_0_item").value.present?
  end

  def fill_in_new_item
    fill_in find('input[name$="[code]"]')[:id], with: '321'
    fill_in find('input[name$="[name]"]')[:id], with: 'Chocolate'
    fill_in find('input[name$="[price]"]')[:id], with: '12,34'
    fill_in find('input[name$="[unit]"]')[:id], with: 'piece'
  end
end
