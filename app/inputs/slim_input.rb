class SlimInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field attribute_name, input_options
  end

  def label
    false
  end

  def input_html_classes
    super << 'form-control'
  end

  private

    def input_options
      {
        placeholder: raw_label_text,
        title: raw_label_text
      }.deep_merge input_html_options
    end
end
