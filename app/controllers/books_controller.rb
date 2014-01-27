class BooksController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_organization
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /books
  def index
    @books = @organization.books
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = @organization.books.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @title = t 'books.new.title'
    @book = @organization.books.new book_params

    create_and_respond
  end

  # PUT/PATCH /books/1
  def update
    @title = t 'books.edit.title'

    update_and_respond
  end

  # DELETE /books/1
  def destroy
    destroy_and_respond
  end

  private

  def set_organization
    @organization = @book ? @book.organization : Organization.find(params[:organization_id])
  end

  def set_book
    @book = Book.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def book_params
    params.require(:book).permit :kind, :last_used_number, :lock_version
  end
  alias_method :resource_params, :book_params

  def resource
    @book
  end
  alias_method :after_create_url, :launchpad_url
  alias_method :after_update_url, :launchpad_url

  def edit_resource_url
    edit_book_url @book
  end

  alias_method :after_destroy_url, :launchpad_url
end
