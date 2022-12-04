# frozen_string_literal: true

require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @play = plays(:one)
  end

  test 'should get index' do
    get plays_url, as: :json
    assert_response :success
  end

  test 'should create play' do
    assert_difference('Play.count') do
      post plays_url,
           params: { play: { game_id: @play.game_id,
                             moves: @play.moves,
                             player_id: @play.player_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show play' do
    get play_url(@play), as: :json
    assert_response :success
  end

  test 'should update play' do
    patch play_url(@play),
          params: { play: { game_id: @play.game_id,
                            moves: @play.moves,
                            player_id: @play.player_id } }, as: :json
    assert_response :success
  end

  test 'should destroy play' do
    assert_difference('Play.count', -1) do
      delete play_url(@play), as: :json
    end

    assert_response :no_content
  end
end
