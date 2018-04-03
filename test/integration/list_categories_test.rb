require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
    def setup
        @category = Category.create(name: "Ruby")
        @category2 = Category.create(name: "JavaScript")
        @category3 = Category.create(name: "Motivation")
        @category4 = Category.create(name: "DevOps")
    end

    test "should list all categories" do
        get categories_path
        assert_template 'categories/index'
        assert_select "a[href=?]", category_path(@category), text: @category.name
        assert_select "a[href=?]", category_path(@category2), text: @category2.name
        assert_select "a[href=?]", category_path(@category3), text: @category3.name
        assert_select "a[href=?]", category_path(@category4), text: @category4.name
    end
end