module Types
  class CompanyDomainType < Types::BaseObject
    field :domain_part_of_email, String, null: false
    field :use_personal_email, Boolean, null: false
    field :users, [Types::UserType], null: true
    def users ## how to avoid N+1 queries
      BatchLoader::GraphQL.for(object.id).batch(default_value: []) do |company_domain_ids, loader|
        User.where(company_domain_id: company_domain_ids).each do |user|
          loader.call(user.company_domain_id) { |email| email << user }
        end
      end
    end
  end
end
