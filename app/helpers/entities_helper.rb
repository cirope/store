module EntitiesHelper
  def tax_conditions
    Entity::TAX_CONDITIONS.map { |c| [t("entities.conditions.#{c}"), c] }
  end

  def city_label
    raw city_text_label << ' ' << add_city_link
  end

  def city_select form
    form.association(
      :city,
      label: city_label,
      collection: states_and_cities,
      as: :grouped_select,
      group_method: :cities,
      prompt: true,
      input_html: { data: { update_after_city_change: true } }
    )
  end

  def entity_phones entity
    entity.phones.build if entity.phones.empty?

    entity.phones
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
