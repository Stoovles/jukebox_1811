class Admin::AwardsController < Admin::BaseController
  def index
    @award = Award.new
    @awards = Award.all
  end


  def new
  end


  def create
    @award = Award.new(award_params)
    if @award.save
      redirect_to admin_awards_path
    end
  end

  private


  def award_params
  params.require(:award).permit(:name)
end


end
