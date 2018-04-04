module ApplicationHelper


    def blog_text_teaser
        @articles = Article.order('created_at DESC').first(4)
    end

    def popular_category
        @categories = Category.all
    end

end
