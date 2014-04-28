module EmptyIndexHelper
  include ERB::Util

  def empty_index_content empty_message: t('views.generic.empty_index')
    if params[:q].blank?
      content_tag :strong, empty_message
    else
      empty_search_content
    end
  end

  private

    def empty_search_content
      out = content_tag(
        :h4, t('views.generic.empty_search.title_html', search: h(params[:q]))
      )
      out << render('shared/empty_search_suggestions')
    end
end
