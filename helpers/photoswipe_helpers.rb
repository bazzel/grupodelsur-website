module PhotoswipeHelpers
  def gallery_image_tag(image)
    size = image_size(image.url)
    w    = size.w
    h    = size.h
    link = link_to thumbnail(image, w: 800), image.url, 'data-size': "#{w}x#{h}", itemprop: 'contentUrl'

    #content_tag(:figure, link, itemprop: 'associatedMedia',
                               #itemscope: '',
                               #itemtype: 'http://schema.org/.ImageObject')
  end

  # @example
  #   size = image_size('//images.contentful..../image.jpg')
  #   p "width: #{size.w}", "height: #{size.h}"
  def image_size(url)
    h = Hash[*%i(w h).zip(FastImage.size(preprend_protocol(url))).flatten]
    OpenStruct.new(h)
  end

  def thumbnail(image, opts)
    url  = "#{image.url}?#{URI.encode_www_form(opts)}"
    size = image_size(url)

    image_tag(url, alt: image.title,
                   itemprop: 'thumbnail',
                   width: size.w,
                   height: size.h)
  end

  def preprend_protocol(url)
    "http:#{url}"
  end
end
