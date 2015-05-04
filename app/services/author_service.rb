class AuthorService
  def get_author(id)
    author = Author.find_by_id(id)
  end
end
