# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Blog.Content

titles = ["First Post", "Second Post", "Third Post"]

contents = [
  "This is the content of the first post.",
  "This is the content of the second post.",
  "This is the content of the third post."
]

for i <- 0..2 do
  post_params = %{
    title: Enum.at(titles, i),
    content: Enum.at(contents, i)
  }

  Content.create_post(post_params)
end
