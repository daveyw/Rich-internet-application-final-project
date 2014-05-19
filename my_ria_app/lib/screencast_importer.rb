require 'feedjira'

class ScreencastImporter
  def self.import_railscasts

    # because the Railscasts feed is targeted at itunes, there is additional metadata that
    # is not collected by Feedjira by default. By using add_common_feed_entry_element,
    # we can let Feedjira know how to map those values. See more information at
    # http://www.ruby-doc.org/gems/docs/f/Feedjira-0.1.2/Feedjira/Feed.html
   # Feedjira::Feed.add_common_feed_entry_element(:enclosure, :value => :url, :as => :video_url)
   # Feedjira::Feed.add_common_feed_entry_element('itunes:duration', :as => :duration)

    # Capture the feed and iterate over each entry
    feed = Feedjira::Feed.fetch_and_parse("http://feeds.feedburner.com/TedtalksHD")
    feed.entries.each do |entry|

      # Strip out the episode number from the title
      #title = entry.title.gsub(/^#\d+\s/, '')
      url = entry.image
      new_url = url.slice(0..(url.index('?')))
    #entry = feed.entries.first
      # Find or create the screencast data into our database
      Screencast.create(
          title:        entry.title,
          summary:      entry.summary,
          video_url:    new_url,
          link:         entry.url,
          published_at: entry.published,
          source:       'TED' # set this manually
      )
   end

    # Return the number of total screencasts for the source
    Screencast.where(source: 'railscasts').count
  end
end