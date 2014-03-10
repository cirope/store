module ApplicationHelper
  def title
    [t('app_name'), @title].compact.join(' | ')
  end

  def remote_if_xhr
    { remote: true } if request.xhr?
  end

  def shallow_args parent, child
    child.new_record? ? [parent, child] : child
  end
end
