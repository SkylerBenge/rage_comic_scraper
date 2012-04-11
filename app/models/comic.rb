class Comic < ActiveRecord::Base
  include ComicImporter

  # Reddit stores times as unix timestamps
  def submitted_at=(time)
    self[:submitted_at] = Time.at(time.to_i)
  end

  def self.sync_with_reddit!
    ComicImporter::PAGES.each do |page|
      ComicImporter.browse(:page => page).each do |comic_attributes|
        Comic.find_or_create_by_reddit_id(comic_attributes[:reddit_id]).tap do |comic|
          comic.attributes = comic_attributes
          comic.save!
        end
      end

      # As a courtesy to Reddit.com, wait at least 2 seconds between requests.
      sleep(2.0)
    end
  end

end
