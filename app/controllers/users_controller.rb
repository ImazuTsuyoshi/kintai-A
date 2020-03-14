class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info,  :edit1_basic_info, :update_basic1_info,:edit2_basic_info, :update_basic2_info, :edit3_basic_info, :update_basic3_info, :edit4_basic_info, :update_basic4_info]
  #before_action :logged_in_user, only: [ :index, :edit, :update, :destroy, :edit_basic_info, :update_basic_info,  :edit1_basic_info, :update_basic1_info,:edit2_basic_info, :update_basic2_info, :edit3_basic_info, :update_basic3_info, :edit4_basic_info, :update_basic4_info]
  before_action :correct_user, only: [:edit, :update, :edit_basic_info,  :edit1_basic_info]
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show
  before_action :admin_or_correct_user, only: :show

 
 def index
   @users = User.all
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end 
      format.csv do
          #csv用の処理を書く
          send_data render_to_string, filename: "(ファイル名).csv", type: :csv
      end
    end
   if params[:search]
      @users = User.where('LOWER(name) LIKE ?', "%#{params[:search][:name].downcase}%").paginate(page: params[:page])
   else
      @users = User.paginate(page: params[:page])
   end
 end
 
  def import
  if params[:csv_file].blank?
    redirect_to(users_url)
  else
    num = Admin::User.import(params[:csv_file])
    redirect_to(users_url, notice: "#{num.to_s}件のユーザー情報を追加 / 更新しました")
  end
    
  end
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      render :index      
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}を削除しました。"
    redirect_to users_url
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end
  
  def edit_basic_info
  end
  
  def update_basic_info
    if @user.update_attributes(basic_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def admin_or_correct_user
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "残念でした！"
      redirect_to(root_url)
    end
  end
  
  def working
    @users = User.all.includes(:attendances)
    @user = User.find_by(params[:id])
    @first_day = Date.today.beginning_of_month
  @last_day = @first_day.end_of_month
  (@first_day..@last_day).each do |day|
    unless @user.attendances.any? {|attendance| attendance.worked_on == day}
      record = @user.attendances.build(worked_on: day)
      record.save
    end
  end
    @dates = user_attendances_month_date
    @attendance = @user.attendances.find_by(worked_on: Date.today)
    if @attendance.started_at.nil?
      @attendance.update_attributes(started_at: current_time)
    end  
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :affiliation, :employee_number,  :uid, :basic_work_time, :designated_work_start_time, :designated_work_end_time,:password)
    end
    
    def basic_params
      params.require(:user).permit(:basic_time, :work_time)
    end
end