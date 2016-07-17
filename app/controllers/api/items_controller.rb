class Api::ItemsController < ApplicationController
  before_action :authenticate_seller!, except: %i|index show sold_items category_items|
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @items_response = Hash.new 
    @items_response[:items] = Array.new 
    @items.each do |item|
      temp_item = Hash.new
      temp_item[:title] = item.title
      temp_item[:description] = item.description
      temp_item[:price] = item.price
      temp_item[:status] = item.status
      unless item.status.eql?('banned')
       temp_item[:published_date] = item.published_date
       temp_item[:Seller_Name] = Seller.find(item.seller_id).name
       temp_item[:Seller_Latitude] = Seller.find(item.seller_id).latitude
       temp_item[:Seller_Longitude] = Seller.find(item.seller_id).longitude
      end
      temp_item[:Category] = Category.find(item.category_id).name
      @items_response[:items] << temp_item
    end
    render json: {response: @items_response, count: @items_response[:items].count }, status: :ok
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item_response = Hash.new 
    @item_response[:item] = Array.new 

      temp_item = Hash.new
      temp_item[:title] = @item.title
      temp_item[:description] = @item.description
      temp_item[:price] = @item.price
      temp_item[:status] = @item.status
      unless @item.status.eql?('banned')
       temp_item[:published_date] = @item.published_date
       temp_item[:Seller_Name] = Seller.find(@item.seller_id).name
      end
      @item_response[:item] << temp_item
    
    render json: {response: @item_response, count: @item_response[:item].count }, status: :ok
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.seller_id = current_seller.id
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item.seller_id = current_seller.id
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sold_items
    @sold_items = Item.find_items('sold', 1)
    @items_response = Hash.new 
    @items_response[:items] = Array.new 
    @sold_items.each do |item|
      temp_item = Hash.new
      temp_item[:title] = item.title
      temp_item[:description] = item.description
      temp_item[:price] = item.price
      temp_item[:status] = item.status
      unless item.status.eql?('banned')
       temp_item[:published_date] = item.published_date
       temp_item[:Seller_Name] = Seller.find(item.seller_id).name
       temp_item[:Seller_Latitude] = Seller.find(item.seller_id).latitude
       temp_item[:Seller_Longitude] = Seller.find(item.seller_id).longitude
      end
       temp_item[:Category] = Category.find(item.category_id).name
       @items_response[:items] << temp_item
    end
    render json: {items: @items_response, count: @items_response[:items].count}, status: :ok
  end

  def category_items
    category_id = 1
    @category_items = Item.category_items(category_id)
    @items_response = Hash.new 
    @items_response[:items] = Array.new 
    @category_items.each do |item|
      temp_item = Hash.new
      temp_item[:title] = item.title
      temp_item[:description] = item.description
      temp_item[:price] = item.price
      temp_item[:status] = item.status
      unless item.status.eql?('banned')
       temp_item[:published_date] = item.published_date
       temp_item[:Seller_Name] = Seller.find(item.seller_id).name
       temp_item[:Seller_Latitude] = Seller.find(item.seller_id).latitude
       temp_item[:Seller_Longitude] = Seller.find(item.seller_id).longitude
      end
       temp_item[:Category] = Category.find(item.category_id).name
      @items_response[:items] << temp_item
    end
    render json: {items: @items_response, count: @items_response[:items].count}, status: :ok
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, 
        :description, 
        :price, 
        :status, 
        :published_date,
        :category_id,
        :seller_id)
    end
  
end
