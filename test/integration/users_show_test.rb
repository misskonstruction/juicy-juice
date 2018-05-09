require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(username: "camille", 
                        email: "camille@example.com",
                        password: "password", 
                        password_confirmation: "password")
    @recipe = Recipe.create(name: "vegetable saute", 
        description: "great vegetable sautee, add vegetable and oil", 
        user: @user)
    @recipe2 = @user.recipes.build(name: "chicken saute", 
                          description: "great chicken dish")
    @recipe2.save
  end
  
  test "should get users show" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
    assert_match @recipe.description, response.body
    assert_match @recipe2.description, response.body
    assert_match @user.username, response.body
  end
end
