require 'test_helper'

class CanvasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canvas = canvases(:one)
  end

  test "should get index" do
    get canvases_url, as: :json
    assert_response :success
  end

  test "should create canvas" do
    assert_difference('Canvas.count') do
      post canvases_url, params: { canvas: { name: @canvas.name } }, as: :json
    end

    assert_response 201
  end

  test "should show canvas" do
    get canvas_url(@canvas), as: :json
    assert_response :success
  end

  test "should update canvas" do
    patch canvas_url(@canvas), params: { canvas: { name: @canvas.name } }, as: :json
    assert_response 200
  end

  test "should destroy canvas" do
    assert_difference('Canvas.count', -1) do
      delete canvas_url(@canvas), as: :json
    end

    assert_response 204
  end
end
