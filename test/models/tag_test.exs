defmodule Jilosrv.TagTest do
  use Jilosrv.ModelCase

  alias Jilosrv.Tag

  @valid_attrs %{note: "some content", tag: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Tag.changeset(%Tag{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tag.changeset(%Tag{}, @invalid_attrs)
    refute changeset.valid?
  end
end
