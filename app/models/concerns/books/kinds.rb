module Books::Kinds
  extend ActiveSupport::Concern

  def kind_class
    kind_class_name.constantize
  end

  def sheets
    send kind_class_name.tableize
  end

  def valid_kinds
    income? ? organization.issuable_receipts : ['P']
  end

  private

    def kind_class_name
      case kind
      when 'A', 'B', 'C'
        'Invoice'
      when 'X'
        'Receipt'
      when 'P'
        'Purchase'
      end
    end
end
