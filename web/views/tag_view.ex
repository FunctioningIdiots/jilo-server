defmodule Jilosrv.TagView do
  use Jilosrv.Web, :view

  def render("index.json", %{tags: tags}) do
    %{data: render_many(tags, Jilosrv.TagView, "tag.json")}
  end

  def render("show.json", %{tag: tag}) do
    %{data: render_one(tag, Jilosrv.TagView, "tag.json")}
  end

  def render("tag.json", %{tag: tag}) do
    %{id: tag.id,
      tag: tag.tag,
      note: tag.note}
  end
end
