class DrinksController < ApplicationController
  include StarbucksScrapesConcern
  before_action :drink_save, only: [:index]
  def index
   @shop=params[:shop]
   @drinks=Drink.where(shop: @shop)
  end

  def show
    @drink=Drink.find(params[:id])

  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def drink_save
    if params[:shop]=="starbucks"
      @drink_names,@images = set_starbucks_shops
    elsif params[:shop]=="dotor"
      @drink_names = set_dotor_shops
    else
      @drink_names = set_tullys_shops
      @drink_names = @drink_names.drop(1)
    end
    drink_names = []
    p @images
    @drink_names.zip(@images) do |drink_name,image|
      drink_names << Drink.new(name: drink_name ,image_id: image,shop: params[:shop])
    end
    # DBアクセス一回で配列を保存できるgem activerecord-import
    Drink.import drink_names,validate_uniqueness: true
  end
end
