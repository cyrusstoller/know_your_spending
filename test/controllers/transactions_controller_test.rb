require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { amount: @transaction.amount, category: @transaction.category, date_of_transaction: @transaction.date_of_transaction, location_address: @transaction.location_address, location_city: @transaction.location_city, location_lat: @transaction.location_lat, location_lon: @transaction.location_lon, location_state: @transaction.location_state, location_zip: @transaction.location_zip, pending: @transaction.pending, plaid_account_id: @transaction.plaid_account_id, plaid_category_id: @transaction.plaid_category_id, transaction_id: @transaction.transaction_id, transaction_type: @transaction.transaction_type, user_id: @transaction.user_id } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test "should show transaction" do
    get transaction_url(@transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { amount: @transaction.amount, category: @transaction.category, date_of_transaction: @transaction.date_of_transaction, location_address: @transaction.location_address, location_city: @transaction.location_city, location_lat: @transaction.location_lat, location_lon: @transaction.location_lon, location_state: @transaction.location_state, location_zip: @transaction.location_zip, pending: @transaction.pending, plaid_account_id: @transaction.plaid_account_id, plaid_category_id: @transaction.plaid_category_id, transaction_id: @transaction.transaction_id, transaction_type: @transaction.transaction_type, user_id: @transaction.user_id } }
    assert_redirected_to transaction_url(@transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
