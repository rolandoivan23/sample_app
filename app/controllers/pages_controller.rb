class PagesController < ApplicationController
  def home
  	@titulo = "Home"
  end

  def contact
  	@titulo = "Contact"
  end
  
  def about
  	@titulo = "About"
  end

end
