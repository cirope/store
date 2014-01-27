module OrganizationsHelper
  def render_book_list
    render(
      'shared/unordered_list',
      title: Book.model_name.human(count: @organization.books.count),
      collection: @organization.books
    )
  end
end
