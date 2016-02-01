defmodule Jilosrv.NoteView do
  use Jilosrv.Web, :view

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, Jilosrv.NoteView, "note.json")}
  end

  def render("show.json", %{note: note}) do
    %{data: render_one(note, Jilosrv.NoteView, "note.json")}
  end

  def render("note.json", %{note: note}) do
    %{id: note.id,
      text: note.text}
  end
end
