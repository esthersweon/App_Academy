module CommentsHelper

  def recursive_comments(root, link_id)
    out = "#{ "<ul>"} #{root.body} -- #{ root.author.username} " + "#{link_to("Reply", new_link_comment_url(link_id: link_id, parent_comment_id: root.id))}"
    return "#{ "<ul>"} #{root.body} -- #{root.author.username} " + "#{link_to("Reply", new_link_comment_url(link_id: link_id, parent_comment_id: root.id))} #{"</ul>"}" if root.children.empty?
    root.children.each do |child|
      out += recursive_comments(child, link_id)
    end
    out += "#{ "</ul>"}"
    #comment_url.html_safe
  end

end
