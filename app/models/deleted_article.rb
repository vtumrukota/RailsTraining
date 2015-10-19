class DeletedArticle < ActiveRecord::Base
  include Deletable
  extend RecentHelper

  validates_presence_of :name, :title
  validates_inclusion_of :deleted, :in => [true, false]

end
