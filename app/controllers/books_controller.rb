class BooksController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_organization
  before_action :set_title, except: [:destroy]

  # GET /books
  def index
    @books = @organization.books
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = @organization.books.new flow: params[:flow]
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = @organization.books.new book_params

    @book.save
    respond_with @book, location: launchpad_url
  end

  # PUT/PATCH /books/1
  def update
    update_resource @book, book_params
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

    def book_params
      params.require(:book).permit :kind, :flow, :last_used_number, :lock_version
    end
end
