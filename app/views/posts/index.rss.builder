xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Grimm Outlook Blog Posts"
    xml.link "http://goblog.com"
    xml.atom :link, href: "http://goblog.com/posts.rss", rel: "self", type: "application/rss+xml"
    xml.description "New Posts"

    for product in @products
      xml.item do
        xml.author "admin@goblog.com"
        xml.title post.title
        xml.description post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid "urn:uuid:#{post.id}", isPermaLink: "false"
      end
    end
  end
end