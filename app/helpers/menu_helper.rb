module MenuHelper
  def menu_item_for model, path, name: nil
    name ||= model.model_name.human count: 0
    link   = link_to name, path
    active = model.model_name.route_key == controller_name

    content_tag :li, link, (active ? { class: 'active' } : {})
  end
end
