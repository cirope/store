module ApplicationHelper
  def title
    [t('app_name'), @title].compact.join(' | ')
  end

  def remote_if_xhr
    { remote: true } if request.xhr?
  end
end
