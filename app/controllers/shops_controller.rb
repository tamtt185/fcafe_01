class ShopsController < ApplicationController
  before_action :load_shop, except: [:new, :create, :index]
  before_action :load_shop_type, only: [:index, :edit]

  def index
    @shops = Shop.order_date_desc.shop_by_user(current_user.id).waiting
      .paginate page: params[:page], per_page: Settings.per_page
    @shop = Shop.new
  end

  def create
    @shop = Shop.new shop_params
    if @shop.save
      flash[:success] = t "create_complete"
    else
      flash[:danger] = t "not_create"
    end
    redirect_to :back
  end

  def show
    @comments = @shop.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @shop.update_attributes shop_params
      flash[:success] = t "shop_updated"
      redirect_to shops_path
    else
      render :edit
    end
  end

  def destroy
    if @shop.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "not_delete"
    end
    redirect_to shops_path
  end

  private
  def shop_params
    params.require(:shop).permit :name, :description, :address, :user_id,
      :avatar, :shop_type_id
  end

  def load_shop
    @shop = Shop.find_by id: params[:id]
    unless @shop
      flash[:danger] = t "shop_not_found"
      redirect_to :back
    end
  end

  def load_shop_type
    @shop_types = ShopType.all
  end
end
