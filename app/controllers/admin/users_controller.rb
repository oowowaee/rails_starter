class Admin::UsersController < Admin::BaseController
  def new
    @user = User.new
  end

  def index
    @users = User.all.page params[:page]
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      @errors = @user.errors
      render :show
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created"
      redirect_to admin_users_path
    else
      @errors = @user.errors
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :role, :locale)
  end
end
