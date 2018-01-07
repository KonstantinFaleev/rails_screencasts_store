class ItemsController < ApplicationController

  def index
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}" }.join("<br/>")
  end

  # /items/1 GET
  def show

  end

  # items/new GET
  def new

  end

  # /item/1/edit GET
  def edit

  end

  # /items POST
  def create
    @item = Item.create(params[:item])
    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end

  #/items DELETE
  def destroy

  end
end
