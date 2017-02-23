class Admin::StaticpagesController < ApplicationController
  layout "admin_layout"
  
  before_action :authenticate_user!
  before_action :check_admin_permission
end
