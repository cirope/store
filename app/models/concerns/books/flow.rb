module Books::Flow
  extend ActiveSupport::Concern

  included do
    after_initialize :default_flow_value
  end

  def income?
    flow == 'income'
  end

  def outcome?
    flow == 'outcome'
  end

  private

    def default_flow_value
      self.flow ||= 'income'
    end
end
