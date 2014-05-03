module ServicesHelper
  def service_commodity
    @service.build_commodity unless @service.commodity

    @service.commodity
  end
end
