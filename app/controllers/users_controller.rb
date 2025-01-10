class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]  # Tìm người dùng theo ID cho các hành động edit, update, destroy
  
    def index
      @users = User.page(params[:page]).per(10)  # Phân trang với kaminari
      @user_count = User.count  # Đếm tổng số người dùng
    end
  
    # Tạo mới người dùng
    def new
      @user = User.new
    end
  
    # Lưu người dùng mới vào cơ sở dữ liệu
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice: 'Người dùng đã được tạo thành công.'
      else
        render :new
      end
    end
  
    # Hiển thị form chỉnh sửa người dùng
    def edit
    end
  
    # Cập nhật thông tin người dùng
    def update
      if @user.update(user_params)
        redirect_to users_path, notice: 'Thông tin người dùng đã được cập nhật.'
      else
        render :edit
      end
    end
  
    # Xóa người dùng
    def destroy
      @user.destroy
      redirect_to users_path, notice: 'Người dùng đã bị xóa.'
    end
  
    private
  
    # Tìm người dùng theo ID
    def set_user
      @user = User.find(params[:id])
    end
  
    # Các tham số cho người dùng
    def user_params
      params.require(:user).permit(:email_address, :password, :password_confirmation)
    end
  end