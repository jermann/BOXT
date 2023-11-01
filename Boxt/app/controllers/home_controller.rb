class HomeController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @storage = Storage.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy
    flash[:notice] = "Storage '#{@storage.name}' booked."
    
    redirect_to '/'
  end

  def create
    @storage = Storage.create!(storage_params)
    flash[:notice] = "#{@storage.name} was successfully created."
    redirect_to '/'
  end

  def new
    # default: render 'new' template
  end

  def index
    @storages = Storage.all

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
    params.require(:storage).permit(:name, :available_space, :price, :campus_dist, :rating, :start_date, :end_date)
  end
end
