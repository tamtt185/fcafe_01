class CommentsController < ApplicationController
  before_action :load_comment, only: [:edit, :update, :destroy]
  before_action :load_shop, only: [:update, :destroy]

  def create
    @shop = Shop.find_by id: comment_params[:shop_id]
    @comment = current_user.comments.build comment_params
    if @comment.save
      list_comments
      respond
    else
      flash[:danger] = t ".comment_not_create"
      redirect_to :back
    end
  end

  def edit
    respond
  end

  def update
    if @comment.update_attributes comment_params
      list_comments
      respond
    else
      flash[:danger] = t ".comment_not_update"
      redirect_to shop_path @shop.id
    end
  end

  def destroy
    if @comment.destroy
      list_comments
      respond
    else
      flash[:danger] = t "comment_not_delete"
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :shop_id
  end

  def list_comments
    @comments = @shop.comments
  end

  def respond
    respond_to do |format|
      format.js
    end
  end

  def load_shop
    @shop = Shop.find_by id: @comment.shop_id
    unless @shop
      flash[:danger] = t ".shop_not_found"
      redirect_to :back
    end
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    unless @comment
      flash[:danger] = t ".comment_not_found"
      redirect_to :back
    end
  end
end
