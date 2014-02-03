module LaunchpadHelper
  def new_ticket_path book
    polymorphic_path [book, book.kind_class], action: :new
  end
end
