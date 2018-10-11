class AddInstitutionNameJobJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)

    item_response = PlaidClient.item.get(user.plaid_access_token)
    institution_response = PlaidClient.institutions.get_by_id(item_response['item']['institution_id'])
    user.institution_name = institution_response['institution']['name']

    user.save
  end
end
