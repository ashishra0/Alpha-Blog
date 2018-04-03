require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    def setup
        @category = Category.create(name: "Engineering")
        @user = User.create(username: "Ashish", email: "ashish@example.com", password: "heyhey", admin: true)
    end


    test "should get categories index" do
        get categories_url
        assert_response :success
    end

    test "should get new" do
        sign_in_as(@user, "heyhey")
        get new_category_url
        assert_response :success
    end

    test "should get show" do
        get category_url(@category)
        assert_response :success
    end

    test "should get redirected to root if not admin" do
        assert_no_difference 'Category.count' do
            post categories_path, params: {category:{name: "Engineering"}}         
        end
        assert_redirected_to categories_path
    end

end