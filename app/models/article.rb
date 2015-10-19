class Article < ActiveRecord::Base
  include Deletable
  extend RecentHelper

  has_one :attachment

  validates_presence_of :name, :title
  validates_inclusion_of :deleted, :in => [true, false]

end
