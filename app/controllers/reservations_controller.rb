class ReservationsController < ApplicationController
	include ApplicationHelper
	include ReservationsHelper

	before_action :set_dress_size, only: [:create, :check_availability]

  # GET /reservations
  def index
  	@reservations = Reservation.includes(:dress_size).all
  end

  # GET /reservations/new
  def new
  	@reservation = Reservation.new
  	@dress_sizes = Dress.first.dress_sizes
  end

  # POST /reservations
  def create
  	if @dress_size.present?
  		date = Date.parse("#{params['reservation']['delivery_on(1i)']}-#{params['reservation']['delivery_on(2i)']}-#{params['reservation']['delivery_on(3i)']}")
  		date = change_if_weekend_date(date)
  		if can_make_reservation?(@dress_size, date)
  			@dress_size.reservations.build(delivery_on: date).save
  			flash[:success] = "Reservation Successfull."
  			redirect_to root_path
  		else
  			@reservation = Reservation.new
  			@dress_sizes = Dress.first.dress_sizes
  			flash[:danger] = "Already Reserved for selected date."
  			render :new
  		end
  	end
  end

  # Ajax call for loading dress sizes on /reservations/new
  def load_sizes
  	dress = Dress.find(params[:value])
  	@dress_sizes = dress.dress_sizes
  end

  # GET /reservations/availability
  def availability
		@dress_sizes = Dress.first.dress_sizes
  end

  # POST /reservations/check_availability
  def check_availability
  	if params[:search_type] == "date_wise"
  		date = Date.parse("#{params['reservation']['delivery_on(1i)']}-#{params['reservation']['delivery_on(2i)']}-#{params['reservation']['delivery_on(3i)']}")
  		date = change_if_weekend_date(date)
  		if can_make_reservation?(@dress_size, date)
  			flash[:success] = "Requested dress is available on selected date."
  			redirect_to availability_path
  		else
  			flash[:warning] = "Requested dress is NOT available on selected date."
  			redirect_to availability_path
  		end
  	else
      @dates = check_available_dates(@dress_size, params['monthly']['delivery_on(2i)'], params['monthly']['delivery_on(1i)'])
  	end
  end

  private
  def set_dress_size
  	@dress_size = DressSize.find_by(dress_id: params[:dress_id], size: params[:dress_size])
  end
end
