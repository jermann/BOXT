class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @storage = Storage.find(params[:id])
  end

  def destroy
    @storage = Storage.find(params[:id])

    if authorize_user(@storage)
      @storage.destroy
      flash[:notice] = "Storage '#{@storage.name}' deleted."

      redirect_to '/'
    end
  end

  def update
    @storage = Storage.find(params[:id])
  
    bs = params[:storage][:book_space].to_i
  
    if bs > 0
      #Implementation to book space as an user
      new_available_space = @storage.available_space - bs
      @storage.update_attribute(:available_space, new_available_space)
  
      flash[:notice] = "#{bs} sq ft. booked in storage '#{@storage.name}' booked."
      redirect_to '/'
    else
      #Implementation to edit space as an owner 

      # Call the authorize_user method to check if the current user is authorized
      if authorize_user(@storage)
        old_name = @storage.name
        if @storage.update_attributes(storage_params)
          flash[:notice] = "'#{old_name}' updated."
          redirect_to '/'
        else
          invalid_params(@storage)
          redirect_to edit_home_path(@storage)
        end
      end
    end
  end
  
  def edit
    @storage = Storage.find(params[:id])
    authorize_user(@storage)
  end

  def clear_sort_and_filter_session
    session[:sort_by] = nil
    session[:sort_direction] = nil
    session[:min_available_space] = nil
    session[:max_price_per_sqft] = nil
    session[:max_distance_from_campus] = nil
  end

  def new
    # Clear sorting and filtering parameters from session
    clear_sort_and_filter_session
  end

  def create
    clear_sort_and_filter_session
    @storage = Storage.new(storage_params)
    @storage.user = current_user

    if @storage.valid?
      @storage.save
      flash[:notice] = "#{@storage.name} was successfully created."
      redirect_to '/'
    else
      if @storage.errors.any?
        invalid_params(@storage)
      end
      render :new
    end
  end

  def authorize_user(storage)
    if current_user != storage.user
      flash[:notice] = "You are not authorized to edit/delete this storage"
      redirect_to '/'
      return false
    end
    return true 
  end

  def index
    @storages = Storage.all
    @storages = Storage.where.not(available_space: 0.0)

    # Preserve sorting parameters if present
    @sort_by = params[:sort_by] || 'name' # Default sorting column
    @sort_direction = params[:sort_direction] || 'asc' # Default sorting direction

    # Apply sorting
    @storages = sort_storages(@storages, @sort_by, @sort_direction)

    # Get filter criteria
    @min_available_space = params[:min_available_space]
    @max_price_per_sqft = params[:max_price_per_sqft]
    @max_distance_from_campus = params[:max_distance_from_campus]

    # Apply filters if criteria are present
    if @min_available_space.present?
      min_available_space = @min_available_space.to_f
      @storages = @storages.where('available_space >= ?', min_available_space)
    end

    if @max_price_per_sqft.present?
      max_price_per_sqft = @max_price_per_sqft.to_f
      @storages = @storages.where('price <= ?', max_price_per_sqft)
    end

    if @max_distance_from_campus.present?
      max_distance_from_campus = @max_distance_from_campus.to_f
      @storages = @storages.where('campus_dist <= ?', max_distance_from_campus)
    end

    # Store sorting parameters in session
    session[:sort_by] = @sort_by
    session[:sort_direction] = @sort_direction

    # Store filter criteria in session
    session[:min_available_space] = @min_available_space
    session[:max_price_per_sqft] = @max_price_per_sqft
    session[:max_distance_from_campus] = @max_distance_from_campus
  end

 

  def sort_storages(storages, sort_by, sort_direction)
    case sort_by
    when 'name'
      storages.order!(name: sort_direction)
    when 'available_space'
      storages.order!(available_space: sort_direction)
    when 'price'
      storages.order!(price: sort_direction)
    when 'start_date'
      storages.order!(start_date: sort_direction)
    when 'end_date'
      storages.order!(end_date: sort_direction)
    when 'campus_dist'
      storages.order!(campus_dist: sort_direction)
    when 'rating'
      storages.order!(rating: sort_direction)
    end

    storages
  end

  private
  def storage_params
    params.require(:storage).permit(:name, :available_space, :price, :campus_dist, :rating, :start_date, :end_date, :image)
  end

  def invalid_params(st)
    if st.errors.any?
      st.errors.full_messages.each do |msg|
        flash[:notice] = msg
      end
    end
  end


end
