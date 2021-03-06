class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all		
	end

	def show
		@recipe = Recipe.find(params[:id])	
	end

	def new
		@recipe = Recipe.new		
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.chef = Chef.find(1)

		if @recipe.save
			flash[:success] = "Your recipe was created successfully"
			redirect_to recipes_path
		else
			#render template again
			render :new
		end
	end

	def edit
		# We need the form
		@recipe = Recipe.find(params[:id])

	end

	def update
		@recipe = Recipe.find(params[:id])

		if @recipe.update(recipe_params)
			flash[:success] = "Your recipe was updated successfully!"
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end		
	end

	def like
		@recipe = Recipe.find(params[:id])
		Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
		flash[:success] = "You like this recipe"
		redirect_to :back
	end

	private
		def recipe_params
			params.require(:recipe).permit(:name, :summary, :description, :picture)
		end
end