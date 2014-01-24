module EntitiesHelper
  def tax_conditions
    Entity::TAX_CONDITIONS.map { |c| [t("entities.conditions.#{c}"), c] }
  end

  def city_label
    raw city_text_label << ' ' << add_city_link
  end

  private

    def city_text_label
      Entity.human_attribute_name 'city'
    end

    def add_city_link
      link_to new_city_path, title: t('entities.new.city'), data: { remote: true } do
        content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
      end
    end
end
