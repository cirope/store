module Reports::CommoditiesHelper
  def voucher_option_for type
    content_tag :li, link_for(type), options_for(type)
  end

  private

    def link_for type
      link_to t("reports.commodities.by_#{type}"),
        reports_commodities_path(request.params.symbolize_keys.merge(voucher: type))
    end

    def options_for type
      type == params[:voucher] ? { class: 'active' } : {}
    end
end
