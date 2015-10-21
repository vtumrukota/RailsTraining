class Article < ActiveRecord::Base
  include Deletable
  extend RecentHelper

  att_accessible :attachment

  validates_presence_of :name, :title
  validates_inclusion_of :deleted, :in => [true, false]

  belongs_to :attachment, polymorphic: true

end
