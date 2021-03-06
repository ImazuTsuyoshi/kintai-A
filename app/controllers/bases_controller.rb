class BasesController < ApplicationController
  before_action :set_user, only: [ :update, :destroy, :edit_basic_info, :update_basic_info]
  #before_action :correct_user, only: [ :update]
  before_action :admin_user
  
  def index
    @bases = Base.all
  end
  
  def edit
    @base = Base.find(params[:id])
  end
  
  def update
    @base = Base.find(params[:id])
    if @base.update_attributes(base_params)
      flash[:success] = "拠点の更新に成功したぞ。"
      redirect_to bases_url
    else
       flash[:danger] = "拠点名,拠点番号が空だから更新に失敗したぞ。"
       redirect_to bases_url
    end 
  end
  
  def edit_basic_info
  end

  def update_basic_info
  end
  
  
  def create
  @base = Base.new(base_params)
    if @base.save
      flash[:info] = "拠点情報を追加したぞ。"
      redirect_to bases_url
    else 
      render :new
    end
  end
  
  def new
    @base = Base.new
  end 
  
  
  def destroy
    @base.destroy
    flash[:success] = "#{@base.name}のデータを削除しちゃいました。"
    redirect_to bases_url
  end
  
  private
  
    def base_params
      params.require(:base).permit(:base_id, :name, :attendance_sort)
    end
  
    def set_user
      @base = Base.find(params[:id])
    end
  
    def correct_user
      redirect_to(root_url) unless current_user?(@base)
    end
end
