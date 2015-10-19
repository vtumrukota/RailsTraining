class ArticleObserver < ActiveRecord::Observer
  def after_save(article)
    if article.deleted  == true
      DeletedArticle.create :name => article.name, :title => article.title, :deleted => article.deleted
    end
  end
end
