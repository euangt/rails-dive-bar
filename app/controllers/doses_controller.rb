class DosesController < ApplicationController
  # def new 
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  #   @dose.cocktail = @cocktail
  # end 
  
  # def create
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new(dose_params)
  #   @dose.cocktail = @cocktail
  #   if @dose.save
  #     redirect_to cocktail_path(@cocktail)
  #   else
  #     render :new
  #   end
  # end


  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new()
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    if (@dose.save)
      redirect_to @dose.cocktail, notice: "Success"
    else
      render :new
    end
  end


  def destroy 
    @dose = Dose.find(params[:id])
    @dose.destroy
  end 

  private 
  def dose_params 
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
