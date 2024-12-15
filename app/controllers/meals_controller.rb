class MealsController < ApplicationController
  before_action :set_meal, only: %i[ show edit update destroy ]

  before_action :only_admin, except: %i[show index]

  # GET /meals or /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/1 or /meals/1.json
  def show
    query_in = "select p.id, p.name, p.price from products p join mealproducts mp on p.id = mp.product_id where mp.meal_id = #{params[:id]}"
    @products_in = User.find_by_sql(query_in)
    
    query_out = "select id, name, price from products where id not in 
                  (select p.id from products p
                  join mealproducts mp on p.id = mp.product_id 
                  where mp.meal_id = #{params[:id]}
                  )"
    @products_out = User.find_by_sql(query_out)
  end

  # GET /meals/new
  def new
    @meal = Meal.new
    @products = Product.all
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals or /meals.json
  def create
    @meal = Meal.new(meal_params)
    @meal.save
    # ahora agregamos los productos

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: "Meal was successfully created." }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1 or /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: "Meal was successfully updated." }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1 or /meals/1.json
  def destroy
    @meal.destroy!

    respond_to do |format|
      format.html { redirect_to meals_path, status: :see_other, notice: "Meal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:name, :price, :image_url)
    end
end
