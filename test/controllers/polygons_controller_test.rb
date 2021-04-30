require 'test_helper'

class PolygonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @polygon = polygons(:one)
  end

  test "should get index" do
    get polygons_url, as: :json
    assert_response :success
  end

  test "should create polygon" do
    assert_difference('Polygon.count') do
      post polygons_url, params: { polygon: { canvas_id: @polygon.canvas_id, points: @polygon.points } }, as: :json
    end

    assert_response 201
  end

  test "should show polygon" do
    get polygon_url(@polygon), as: :json
    assert_response :success
  end

  test "should update polygon" do
    patch polygon_url(@polygon), params: { polygon: { canvas_id: @polygon.canvas_id, points: @polygon.points } }, as: :json
    assert_response 200
  end

  test "should destroy polygon" do
    assert_difference('Polygon.count', -1) do
      delete polygon_url(@polygon), as: :json
    end

    assert_response 204
  end
end
