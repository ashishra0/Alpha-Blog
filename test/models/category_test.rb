require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "software")
    end

    test "category should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save
        @category = Category.new(name: "Tech")
        assert @category.valid?
    end

    test "name should not be too long" do
        @category.name = "a"*26
        assert_not  @category.valid?
    end

    test "name should not be too short" do
        @category.name = "a"
        assert_not @category.valid?
    end


end