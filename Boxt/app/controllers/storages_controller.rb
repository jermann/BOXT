class StoragesController < ApplicationController
  # Controller actions go here
  def show
    puts "in show"
    id = params[:id] # retrieve movie ID from URI route
    @storage = Storage.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

end