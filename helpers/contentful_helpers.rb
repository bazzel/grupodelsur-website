module ContentfulHelpers

  def multimedia_fragments
    data.website.multimedia_fragments.
       values.
       select(&:active).
       sort_by(&:position)
  end

  def musicians
    data.website.musicians.
       values.
       select(&:active).
       sort_by(&:position)
  end

  def news
    data.website.news.
      values.
      sort_by(&:createdOn).
      reverse
  end

  def galleries
    data.website.galleries.
      values
  end

  def future_events
    data.website.events.
      values.
      select { |e| e.startingAt >= Date.today }.
      sort_by(&:startingAt)
  end

  def events_grouped_by_month(events)
    grouped_by_month events, :startingAt
  end

  def grouped_by_month(events, date_field)
    events.group_by { |e| Date.new(e[date_field].year, e[date_field].month, 1) }
  end

  # `find_page` returns a Contentful Page object for the given `name`.
  # This `name` corresponds with the Contentful Page Entry that matches
  # the ID as defined in data/config.yml.
  #
  # @example:
  #   => find_page 'blog'
  #
  # Prerequisites:
  #  - data/config.yaml should contain a `pages` Hash with
  #    keys that name a page and values to correspond to the IDs
  #    used in Contentful.
  #    E.g.:
  #      pages:
  #        over-kabisa: 2Wiv3BVsF2kmIAmE0Ysgsy
  #        contact: 48KzBMHUZyoQIO0uasOIoQ
  #        ...
  #
  #  - In config.rb Contentful should be activated with the key of the space
  #    set to `site`. If you like to use a different name, specify
  #    the `space` argument when calling the function (or change the default value
  #    in the signature).
  #    The content type that contains the Page should be defined
  #    as `page`:
  #    E.g.:
  #      activate :contentful do |f|
  #        f.space           = { site: 'ede0ajjyowtx' }
  #        ...
  #        f.content_types   = {
  #          page: '35cAGZKRReIE8y6S2cggkk',
  #          ...
  #        }
  #      end
  def find_page(name, space = 'website')
    all_pages = data[space].pages.values
    wanted_id = data.config.pages[name]

    all_pages.detect { |page| page.id == wanted_id }
  end

  # `find_page_for_file` returns a Contentful Page object
  # The passed `filename`'s basename sould match
  # an ID as defined in data/config.yml.
  #
  # @example:
  #   => find_page_for_file __FILE__
  def find_page_for_file(filename)
    find_page File.basename(filename).split('.').first
  end

  # @return [Array] a collection of `Page` objects.
  #
  # @params [String|Symbol] data_config_key refers to a key in data/config.yml
  # that contains an array of `pages`
  #
  # @example
  #   pages_for 'vacancy_terms'
  #   pages_for :vacancy_terms
  def pages_for(data_config_key)
    data.config[data_config_key].map { |item| as_link item }
  end
end
