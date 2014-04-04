module ItemsHelper
  def item_commodity
    @item.build_commodity unless @item.commodity

    @item.commodity
  end
end
