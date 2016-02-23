defmodule Jilosrv.TagControllerTest do
  use Jilosrv.ConnCase

  alias Jilosrv.Tag
  @valid_attrs %{note: "some content", tag: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tag_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = get conn, tag_path(conn, :show, tag)
    assert json_response(conn, 200)["data"] == %{"id" => tag.id,
      "tag" => tag.tag,
      "note" => tag.note}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, tag_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, tag_path(conn, :create), tag: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Tag, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tag_path(conn, :create), tag: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = put conn, tag_path(conn, :update, tag), tag: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Tag, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = put conn, tag_path(conn, :update, tag), tag: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    tag = Repo.insert! %Tag{}
    conn = delete conn, tag_path(conn, :delete, tag)
    assert response(conn, 204)
    refute Repo.get(Tag, tag.id)
  end
end
