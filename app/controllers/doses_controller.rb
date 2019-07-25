class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def index
    @doses = dose.all
  end

  def new
    # find the coctail id then create a new dose
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # create a new dose having all the required params
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # find the relevant cocktail id
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: "cool! you added another dose ;) "
    else
      render :new
    end
  end


  def destroy
    @dose.delete
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  # def ingredient_params
  #   params.require(:ingredient).permit(:name)
  # end
end
