class StoragesController < ApplicationController
  # Controller actions go here
  def show
    #id = params[:id]
    #@storage = Storage.find(id)
    redirect_to '/show'
  end
end