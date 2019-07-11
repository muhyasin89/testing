class PagesController < ApplicationController
  def home
  end

  def about
    render "pages/about"
  end
end
