module TextHelper

  # Takes custom tags and formats for HTML
  def get_url
    self.content[/#{Regexp.escape("[url]")}(.*?)#{Regexp.escape("[/url]")}/m, 1]
  end

  def remove_url_start(url)
    url.slice!(0..7) if url.starts_with?("https://")
    url.slice!(0..6) if url.starts_with?("http://")
    url
  end

  def format_url_tags
    url = remove_url_start(get_url)   
    self.content.gsub!("[url]", '<a href="https://').gsub!("[/url]", '">' + url + '</a>') if has_spaces?(url)
  end

  def has_spaces?(input)
    input == input.split(" ").join
  end
end