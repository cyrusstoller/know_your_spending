class LinkController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def get_access_token
    exchange_token_response = PlaidClient.item.public_token.exchange(params.require(:public_token))

    access_token = exchange_token_response['access_token']
    item_id = exchange_token_response['item_id']

    logger.debug exchange_token_response
    logger.debug "access token: #{access_token}"
    logger.debug "item id: #{item_id}"

    current_user.plaid_access_token = access_token
    current_user.save

    GetTransactionsJob.perform_later(current_user.id)
    AddInstitutionNameJobJob.perform_later(current_user.id)

    redirect_to set_categories_path
  end
end
