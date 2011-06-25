atom_feed :language => 'en-US' do |feed|
  feed.title t :blog_title
  feed.updated @articles.first.created_at

  @articles.each do |item|
    feed.entry(item) do |entry|
      entry.url article_url(item)
      entry.title item.title
      entry.content item.content, :type => 'html'
      # the strftime is needed to work with Google Reader.
      entry.updated(item.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
      entry.author 'Ran Xiang'
    end
  end
end

