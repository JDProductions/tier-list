class UsersController <ApplicationController

  before_action :require_same_user, only: [:edit, :update]


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "Welcome to the OP-OR-Nah Community #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def index
    @user = User.all
  end


def edit
  @user = User.find(params[:id])
end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:success] = "Your account successfully was updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account!"
      redirect_to root_path
    end
    end


end