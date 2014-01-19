module EntitiesHelper
  def tax_conditions
    Entity::TAX_CONDITIONS.map { |c| [t("entities.conditions.#{c}"), c] }
  end
end
