class HomeController < ApplicationController
  def index
    @storages = Storage.all
  end
end
