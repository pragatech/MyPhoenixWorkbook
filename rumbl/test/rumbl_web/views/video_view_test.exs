defmodule RumblWeb.VideoViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [
      %Rumbl.Multimedia.Video{id: 1, title: "dogs"},
      %Rumbl.Multimedia.Video{id: 2, title: "cats"}
    ]

    content = renders_to_string(
      RumblWeb.VideoView,
      "index.html",
      conn: conn,
      videos: videos)

      assert String.contains? content, "Listing Videos"

      for video <- videos do
        assert String.contains? contens, video.title
      end
  end

  test "render new.html", %{conn: conn} do
    owner = user_fixture()
    changeset = Rumbl.Multimedia.change_video(%Rumbl.Multimedia.Video{})
    categories = [%Rumbl.Multimedia.Category{id: 123, name: "cats"}]

    content = renders_to_string(
      RumblWeb.VideoView,
      "new.html",
      conn: conn,
      changeset: changeset,
      categories: categories
    )

    assert String.contains? content, "New Video"
  end

end
