class Video < ActiveRecord::Base
  has_many :attachments, as :article
end
