module CustomerScoped
  extend ActiveSupport::Concern

  module ClassMethods
    def by_customer customer
      where customer_id: customer.id
    end
  end
end
