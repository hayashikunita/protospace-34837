class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destory]
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all
    # @user = User.find(params[:id])
    # @prototypes = @user.prototypes
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototypes_params)

    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

    # @prototype = Prototype.find(params[:id])
  end

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end
    # @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototypes_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    end
  end


  private

  def prototypes_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end