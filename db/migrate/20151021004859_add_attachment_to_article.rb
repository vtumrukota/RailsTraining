class AddAttachmentToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :attachment, polymorphic: true, index: true
  end
end
