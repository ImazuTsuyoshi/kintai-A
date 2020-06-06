class AttendancesController < ApplicationController
  
  before_action :set_user, only: [:edit_one_month, :update_one_month, :edit_approval, :update_approval, :edit_change, :update_change, :edit_month, :update_month,:edit_overtime, :update_overtime, :edit_request_overtime, :update_request_overtime]
  before_action :logged_in_user, only: [:update, :edit_one_month, :update_one_month, :edit_approval, :update_approval, :edit_change, :update_change, :edit_overtime, :update_overtime, :edit_request_overtime, :update_request_overtime]
  before_action :admin_or_correct_user, only: [:update, :edit_one_month, :update_one_month]
  before_action :set_one_month, only: :edit_one_month

  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"
  

  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    if @attendance.started_at.nil?
      if @attendance.update_attributes!(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます！"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "お疲れ様でした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end

  def edit_one_month
  end

  def update_one_month
    ActiveRecord::Base.transaction do
      if attendances_invalid?
        attendances_params.each do |id, item|
        attendance = Attendance.find(id)
        attendance.update_attributes!(item)
    end
      flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
      redirect_to user_url(date: params[:date])
      else
        flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
        redirect_to attendances_edit_one_month_user_url(date: params[:date])
      end
    end
  rescue ActiveRecord::RecordInvalid 
    flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
    redirect_to attendances_edit_one_month_user_url(date: params[:date])
  end
  
  def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
  end
    
   def attendances_invalid?
    attendances = true
    attendances_params.each do |id, item|
      if item[:started_at].blank? && item[:finished_at].blank?
        next
      elsif item[:started_at].blank? || item[:finished_at].blank?
        attendances = false
        break
      elsif item[:started_at] > item[:finished_at]
        attendances = false
        break
      end
    end
    return attendances
   end 
   
  def edit_change
  end  

  def update_change 
  end 
  
  
  def edit_overtime
    @attendance = Attendance.find_by(worked_on: params[:date])
  end

  def update_overtime
    @attendance = @user.attendances.find(params[:id])
      @attendance.update_attributes(overtime_params)
      flash[:success] = "残業申請が完了しました。"
      redirect_to @user 
  end
  
  def edit_approval
    
  end 
  
  def update_approval
  end  
  
  def edit_request_overtime
  end  
  
  def update_request_overtime
  end  
  
  def update_month
    
  end  

  private
  
    def attendances_params
      params.require(:user).permit(attendances: [:started_at, :finished_at, :note, :tomorrow, :instructor_confirmation])[:attendances]
    end
    
    def overtime_params
	   params.permit(:attendance).permit([:end_yotei_time, :tomorrow, :processing_content, :instructor_confirmation])
    end 
    
end