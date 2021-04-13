class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  #ログインしていないユーザーをログインページの画面に促すことができます。
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @prototypes = Prototype.all
  end

  def new
    # @user = User.new
    @prototype = Prototype.new
  end

  def create
    #binding.pry
    #@user = User.create(user_params)
    @prototype = Prototype.new(prototype_params)
    # binding.pry
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
       redirect_to prototype_path
       
    else
      render :edit
    end
  end

  #binding.pry
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  private
  def user_params
    params.require(:user).permit(:update, :new, :create)
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end