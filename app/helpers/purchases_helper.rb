module PurchasesHelper
  def purchase_items
    @purchase.purchase_items.new if @purchase.purchase_items.empty?

    @purchase.purchase_items
  end

  def purchase_number
    @purchase.persisted? ? @purchase.number : @book.next_available_number
  end

  def purchase_date
    @purchase.persisted? ? @purchase.created_at.to_date : Date.today
  end

  def provider_label
    raw provider_text_label << ' ' << add_provider_link
  end

  private

    def provider_text_label
      Purchase.human_attribute_name 'provider'
    end

    def add_provider_link
      link_to new_provider_path, title: t('purchases.new.provider'), data: { remote: true } do
        content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
      end
    end
end
