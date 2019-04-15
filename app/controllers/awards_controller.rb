class SongsController < ApplicationController

  def index
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
  end


end
