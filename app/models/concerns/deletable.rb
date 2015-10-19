module Deletable
  extend ActiveSupport::Concern

  included do
    scope :is_deleted, -> (param) { where('deleted = ?', param) }
  end

  def deleted?
    self.deleted
  end

  def delete_record
    self.deleted = true
    self.save
  end

end
