module ComicImporter

  SUBREDDIT = "fffffffuuuuuuuuuuuu"
  PAGES = ["", "top", "new"]

  def self.browse(options = {})
    page = options[:page] || ""

    raise ArgumentError, "Invalid page specified" unless PAGES.include?(page)
    self.format Reddit::Api.new.browse "#{SUBREDDIT}/#{page}"
  end

  private #####################################################################

  def self.format(submissions)
    [].tap do |formatted_results|
      submissions.each do |submission|
        formatted_results << {
          :reddit_id             => submission.id,
          :domain                => submission.domain,
          :score                 => submission.score,
          :nsfw                  => submission.over_18,
          :downs                 => submission.downs,
          :ups                   => submission.ups,
          :reddit_url            => submission.permalink,
          :title                 => submission.title,
          :submitted_at          => submission.created,
          :comic_strip_from_url  => submission.url
        }
      end
    end
  end

end
