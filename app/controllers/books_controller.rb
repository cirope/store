class BooksController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_organization
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /books
  def index
    @books = @organization.books

    respond_with @books
  end

  # GET /books/1
  def show
    respond_with @book
  end

  # GET /books/new
  def new
    @book = @organization.books.new
    respond_with @book
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @title = t 'books.new.title'
    @book = @organization.books.new book_params

    @book.save
    respond_with @book, location: launchpad_url
  end

  # PUT/PATCH /books/1
  def update
    @title = t 'books.edit.title'

    @book.update book_params
    respond_with @book, location: launchpad_url
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_with @book, location: launchpad_url
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
end
