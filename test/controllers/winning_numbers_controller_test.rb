# frozen_string_literal: true

require 'test_helper'

class WinningNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @winning_number = winning_numbers(:one)
  end

  test 'should get index' do
    get winning_numbers_url, as: :json
    assert_response :success
  end

  test 'should create winning_number' do
    assert_difference('WinningNumber.count') do
      post winning_numbers_url, params: { winning_number: { numbers: @winning_number.numbers } },
                                as: :json
    end

    assert_response :created
  end

  test 'should show winning_number' do
    get winning_number_url(@winning_number), as: :json
    assert_response :success
  end

  test 'should update winning_number' do
    patch winning_number_url(@winning_number),
          params: { winning_number: { numbers: @winning_number.numbers } }, as: :json
    assert_response :success
  end

  test 'should destroy winning_number' do
    assert_difference('WinningNumber.count', -1) do
      delete winning_number_url(@winning_number), as: :json
    end

    assert_response :no_content
  end
end
