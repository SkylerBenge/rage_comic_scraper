class Comic < ActiveRecord::Base
  include ComicImporter

  has_attached_file :comic_strip, :styles => { :thumb => "100x100>" }
  validates_attachment :comic_strip, :presence => true, :size => { :in => 0..3.megabytes }
  validates_attachment_content_type :comic_strip, :content_type => /image/

  # Reddit stores times as unix timestamps
  def submitted_at=(time)
    self[:submitted_at] = Time.at(time.to_i)
  end

  def comic_strip_from_url=(url)
    self.comic_strip = open(url)

    # This should be handled better, but for many imgur comics, if a direct
    # link is not found then simply add .png to the url to get the image.
    unless valid?
      self.comic_strip = open(url + ".png")
    end
  end

  def self.sync_with_reddit!
    ComicImporter::PAGES.each do |page|
      ComicImporter.browse(:page => page).each do |comic_attributes|
        Comic.find_or_initialize_by_reddit_id(comic_attributes[:reddit_id]).tap do |comic|
          comic.attributes = comic_attributes
          comic.save!
        end
      end

      # As a courtesy to Reddit.com, wait at least 2 seconds between requests.
      sleep(2.0)
    end
  end

end
