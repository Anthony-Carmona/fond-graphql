module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :locations, [Types::LocationType]

    field :users, [Types::UserType],
          null: false

    field :all_users, [Types::UserType],
          null: false

    def locations
      Location.limit(10)
    end

    def all_users
      User.limit(10)
    end

    def all_company_domains
      CompanyDomain.limit(10)
    end

    def get_company_domain(company_domain_id:)
      CompanyDomain.find(company_domain_id)
    end

    def get_user(user_id:)
      User.find(user_id)
    end

    field :get_user, Types::UserType, null: false do
      argument :user_id, Int
    end

    field :get_company_domain, Types::CompanyDomainType, null: false do
      argument :company_domain_id, Int
    end

    field :all_company_domains, [Types::CompanyDomainType],
          null: false

  end
end
