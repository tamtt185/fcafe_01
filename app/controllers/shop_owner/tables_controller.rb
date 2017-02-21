class ShopOwner::TablesController < ApplicationController
  layout "shop_owner_layout"
  before_action :load_table, only: [:edit, :update, :destroy]
  before_action :load_shop, only: :index

  def index
    @tables = @shop.tables.newest
      .paginate page: @page, per_page: Settings.per_page
    @table = Table.new
  end

  def create
    table = Table.new table_params
    if table.save
      flash[:success] = t ".table_create"
    else
      flash[:danger] = t ".table_not_create"
    end
    redirect_to :back
  end

  def edit
  end

  def update
    if @table.update_attributes table_params
      flash[:success] = t ".table_updated"
    else
      flash[:danger] = t ".not_update"
    end
    redirect_to shop_owner_tables_path(id: @table.shop_id)
  end

  def destroy
    if @table.destroy
      flash[:success] = t ".del_complete"
    else
      flash[:danger] = t ".not_delete"
    end
    redirect_to :back
  end

  private
  def table_params
    params.require(:table).permit :name, :location, :num_chair, :avatar, :shop_id
  end

  def load_table
    @table = Table.find_by id: params[:id]
    unless @table
      flash[:danger] = t ".table_not_found"
      redirect_to :back
    end
  end

  def load_shop
    @shop = Shop.find_by id: params[:id]
    unless @shop
      flash[:danger] = t ".shop_not_found"
      redirect_to :back
    end
  end
end
