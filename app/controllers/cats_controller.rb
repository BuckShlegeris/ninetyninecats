class CatsController < ApplicationController

  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    @cat = Cat.new(params[:cat])
    @cat.user_id = current_user.id


    if @cat.save!
      @cat.get_photo
      redirect_to cat_url(@cat)
    else
      render @cat.errors
    end
  end

  def new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    if @cat.user_id == current_user.id
      render :edit
    else
      redirect_to cat_url(@cat)
    end
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.user_id != current_user.id
      redirect_to cat_url(@cat)
    elsif @cat.update_attributes(params[:cat])
      redirect_to cat_url(@cat)
    else
      render @cat.errors
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.user_id != current_user.id
      redirect_to cat_url(@cat)
    elsif @cat.destroy
      redirect_to cats_url
    else
      render @cat.errors
    end
  end
end