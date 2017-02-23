class ShopOwner::ShopsController < ApplicationController
  layout "shop_owner_layout"
  
  before_action :authenticate_user!
  before_action :check_shop_owner_permission

  def index
    @shops = Shop.order_date_desc.shop_by_user(current_user.id).approved
      .paginate page: params[:page], per_page: Settings.per_page
  end

  def edit
  end

  def update
    if @shop.update_attributes shop_params
      flash[:success] = t "shop_updated"
      redirect_to shop_owner_shops_path
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
    redirect_to shop_owner_shops_path
  end
end
