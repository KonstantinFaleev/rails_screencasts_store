class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :chack_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item.all
  end

  def expensive
    @items = Item.where("price > 1000")
    render "index"
  end

  # /items/1 GET
  def show
    unless @item
      render text: "Page not found", status: 404
    end
  end

  # items/new GET
  def new
    @item = Item.new
  end

  # /item/1/edit GET
  def edit

  end

  # /items POST
  def create
    @item = Item.create(item_params)
      if @item.errors.empty?
        redirect_to item_path(@item)
      else
        render "new"
      end

   # @item = Item.create(params[:item])
    #if @item.errors.empty?
     # redirect_to item_path(@item)
    #else
      #render "new"
    #end
  end

  def update

    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  #/items DELETE
  def destroy

    @item.destroy
    redirect_to action: "index"
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.permit(:name, :price, :real, :weight, :description)
  end

  def chack_if_admin
    #render text: "Access denied", status: 403 unkess params[:admin]
  end
end
