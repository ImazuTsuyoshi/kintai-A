class ApprovalsController < ApplicationController
  
  def update
    @user = User.find(params[:user_id])
    @approval = Approval.find(params[:id])
  
    if @approval.update_attributes(applovals_params)
      flash[:info] = "1ヶ月分の申請しました"
    else
      flash[:danger] = "1ヶ月分の申請できませんでした"
    end
    redirect_to @user
  end  
   
  def update_one_month
  end 
   
   private
    # 1ヶ月分の勤怠情報を扱います。
    def applovals_params
      params.require(:user).permit(attendances: [:month, :decision, :authorizer])[:applovals]
    end 
end
