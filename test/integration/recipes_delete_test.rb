require 'test_helper'

def setup
  @user = User.create!(chefname: "mashrur", email: "mashrur@example.com")
  @recipe = Recipe.create(name: "vegetable saute", 

            description: "great vegetable sautee, add vegetable and oil", user: @user)
end

test "successfully delete a recipe" do
  get recipe_path(@recipe)
  assert_template 'recipes/show'
  assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
  assert_difference 'Recipe.count', -1 do
    delete recipe_path(@recipe)
  end
  assert_redirected_to recipes_path
  assert_not flash.empty?
end

