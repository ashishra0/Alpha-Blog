module HomeHelper
    def article_helper(index)
        @articles = Article.order('created_at DESC').first(4)
        @article = @articles.fetch(index)
      end

    def blog_text_teaser
        @articles = Article.order('created_at DESC').first(5)
    end

    def popular_category
        @categories = Category.order(@article)
    end
end