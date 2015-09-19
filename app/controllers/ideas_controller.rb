class IdeasController < ApplicationController
  before_action :load_idea, only: [:show, :edit, :update, :destroy]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea was successfully created!"
    else
      flash[:error] = "Idea is missing a title."
    end
    redirect_to ideas_path
  end

  def show
  end

  def index
    @ideas = Idea.all
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path
    else
      render :edit
    end
  end

  def destroy
    @idea.delete
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

  def load_idea
    @idea = Idea.find(params[:id])
  end
end