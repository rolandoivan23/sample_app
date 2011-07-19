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

  def help
    @titulo = "Help"
  end

end
