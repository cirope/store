module Books::KindClass
  extend ActiveSupport::Concern

  def kind_class
    case kind
    when 'A', 'B', 'C'
      Invoice
    when 'X'
      Receipt
    end
  end
end
