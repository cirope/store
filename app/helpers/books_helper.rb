module BooksHelper
  def kinds
    @book.valid_kinds.map { |k| [t("books.kinds.#{k}"), k] }
  end

  def render_organization_books organization: @organization, flow: @book.flow
    render(
      'launchpad/organization_books',
      organization: organization,
      books: organization_flow_books(organization: organization, flow: flow),
      flow: flow
    )
  end

  private

    def organization_flow_books organization: @organization, flow: @book.flow
      case flow
      when 'income'
        organization.books.income
      when 'outcome'
        organization.books.outcome
      end
    end
end
