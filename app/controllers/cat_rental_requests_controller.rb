class CatRentalRequestsController < ApplicationController
  def index
    @cat = Cat.find_by_id(params[:cat_id])
    @requests = @cat.cat_rental_requests

    render :index
  end

  def create
    @cat_rental_request = CatRentalRequest.new(params[:cat_rental_request])
    if @cat_rental_request.save!
      redirect_to cat_url(Cat.find_by_id(@cat_rental_request.cat_id))
    else
      render @cat_rental_request.errors
    end
  end

  def new
    @cat = Cat.find(params[:cat_id])
    render :new
  end

  def approve!
    @cat = Cat.find_by_id(params[:cat_id])
    if @cat.user_id == current_user.id
      @cat_rental_request = CatRentalRequest.find_by_id(params[:cat_rental_request_id])

      @cat_rental_request.approve!

      if @cat_rental_request.save!
        redirect_to cat_url(Cat.find_by_id(@cat_rental_request.cat_id))
      else
        render @cat_rental_request.errors
      end
    else
      redirect_to cat_url(@cat)
    end
  end

  def deny!
    @cat = Cat.find_by_id(params[:cat_id])
    if @cat.user_id == current_user.id
      @cat_rental_request = CatRentalRequest.find_by_id(params[:cat_rental_request_id])

      @cat_rental_request.deny!

      if @cat_rental_request.save!
        redirect_to cat_url(Cat.find_by_id(@cat_rental_request.cat_id))
      else
        render @cat_rental_request.errors
      end
    else
      redirect_to cat_url(@cat)
    end
  end
end
