class Admin::RequestsController < ApplicationController
  layout "admin_layout"

  before_action :authenticate_user!
  before_action :check_admin_permission
  before_action :load_shop, only: [:update, :destroy]
  
  def index
    @supports = Supports::RequestSupport.new params[:page]
  end

  def update
    @shop.update status: params[:value]
    if @shop.save
      flash[:success] = t "success"
    else
      flash[:danger] = t "not_success"
    end
    redirect_to :back
  end

  private
  def load_shop
    @shop = Shop.find_by id: params[:id]
    unless @shop
      flash[:success] = t "shop_not_found"
      redirect_to :back
    end
  end
end
