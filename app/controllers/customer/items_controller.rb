class Customer::ItemsController < ApplicationController
def index
  @items=Item.all
end

def show
  @item = Item.find(params[:id])
end

def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active, :genre_id)
end

end
