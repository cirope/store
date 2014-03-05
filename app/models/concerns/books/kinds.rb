module Books::Kinds
  extend ActiveSupport::Concern

  def kind_class
    case kind
    when 'A', 'B', 'C'
      Invoice
    when 'X'
      Receipt
    when 'P'
      Purchase
    end
  end

  def valid_kinds
    income? ? organization.issuable_receipts : ['P']
  end
end
