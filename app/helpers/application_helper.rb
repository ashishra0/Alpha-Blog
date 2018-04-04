module ApplicationHelper


    def blog_text_teaser
        @articles = Article.order('created_at DESC').first(5)
    end

    def popular_category
        @categories = Category.all.limit(5)
    end

end
