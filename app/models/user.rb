class User < ApplicationRecord
  belongs_to :company_domain
  belongs_to :location
end
