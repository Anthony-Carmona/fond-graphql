module Types
  class UserType < Types::BaseObject
    field :company_domain, Types::CompanyDomainType, null: false
    field :email, String, null: false
    field :company_domain_id, Int
    field :location, Types::LocationType
  end
end
