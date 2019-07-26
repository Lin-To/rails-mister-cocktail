class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def index
    @doses = dose.all
  end

  def new
    # find the coctail id then create a new dose
    # cocktail/34/doses/new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.all.order(name: :asc)
  end

  def create
    # create a new dose having all the required params
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.all.order(name: :asc)
    # find the relevant cocktail id
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: "cool! you added another dose ;) "
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    @cocktail = @dose.cocktail
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
