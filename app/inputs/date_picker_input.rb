class DatePickerInput < SimpleForm::Inputs::Base
  def input wrapper_options
    options = merge_wrapper_options input_html_options, wrapper_options

    @builder.text_field attribute_name, default_options.deep_merge(options)
  end

  def input_html_classes
    super << 'form-control'
  end

  private

    def default_options
      { value: value, autocomplete: 'off', data: { date_picker: true } }
    end

    def value
      I18n.l object.send(attribute_name) if object.send attribute_name
    end
end
