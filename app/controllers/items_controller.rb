class ItemsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy, :edit]

  # GET /items
  # GET /items.json
  #
  # params:
  # => tag_name : the name of the tag
  # => parent_id : to retrieve children
  #
  def index

    query_parts = []

    if (params[:tag_name])
      query_parts << "tags.name LIKE '#{params[:tag_name]}'"
    end

    if (params[:parent_id])
      query_parts << "parent_id = #{params[:parent_id]}"
    end

    @items = Item.find(:all, joins: :tags, conditions: query_parts)

    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    get_relations_from_params

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    get_relations_from_params

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
  def get_relations_from_params
    @item.parent = @parent
    @item.author = @author

    @tags = Array.new
    params[:tags].each do |tag|
      @tags << Tag.find(tag[:id])
    end

    @item.tags = @tags
  end
end
