module BoundsHelper
  def bound_uses form
    bound = form.object

    bound.uses.new if bound.uses.empty?

    bound.uses
  end

  def link_to_uses form
    cart_icon = content_tag :span, nil, class: 'glyphicon glyphicon-shopping-cart'

    link_to cart_icon, "#uses-#{form.object.object_id}", class: 'text-muted', data: { toggle: 'collapse' }
  end
end
