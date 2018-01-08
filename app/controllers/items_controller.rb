class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  # /items/1 GET
  def show
    unless @item = Item.where(id:params[:id]).first
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
    @item = Item.create(params[:item])
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  #/items DELETE
  def destroy

  end
end
