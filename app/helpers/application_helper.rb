module ApplicationHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    each_line = lyrics.lines
    with_notes = each_line.map {|line| line = "&#9835; #{h(line)}"}.join
    "<pre>#{with_notes}</pre>".html_safe
  end
end
