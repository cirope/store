module LaunchpadHelper
  def new_ticket_path book
    polymorphic_path [book, book.kind_class], action: :new
  end

  def add_book_link organization: nil, flow: nil
    title = t "organizations.new.#{flow}_book"
    path = new_organization_book_path organization, flow: flow

    link_to path, title: title, data: { remote: true } do
      content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
    end
  end
end
