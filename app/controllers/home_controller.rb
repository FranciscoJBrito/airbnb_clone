# Home controller to display the list of properties on the home page
class HomeController < ApplicationController
  def index
    @properties = Property.all
  end
end
