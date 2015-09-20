class IdeasController < ApplicationController
  before_action :get_user, :load_idea, only: [:show, :edit, :update, :destroy]

  def new
    @idea = get_user.ideas.new
  end

  def create
    @idea = get_user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea was successfully created!"
    else
      flash[:error] = "Idea is missing a title."
    end
    redirect_to user_ideas_path(@user)
  end

  def show
  end

  def index
    @ideas = get_user.ideas
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to user_idea_path
    else
      render :edit
    end
  end

  def destroy
    @idea.delete
    redirect_to user_ideas_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def load_idea
    @idea = get_user.ideas.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end
end