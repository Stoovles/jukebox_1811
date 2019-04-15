class AwardsController < ApplicationController

  def index
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
    @songs = Song.songs_for_awards(@award)
  end


end
