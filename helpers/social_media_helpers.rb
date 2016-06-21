module SocialMediaHelpers
  def link_to_twitter
    link_to 'Twitter', "https://twitter.com/#{data_social_media.twitter}", class: 'twitter'
  end

  def link_to_facebook
    link_to 'Facebook', "https://www.facebook.com/#{data_social_media.facebook}", class: 'facebook'
  end

  def link_to_youtube
    link_to 'Youtube', "https://www.youtube.com/channel/#{data_social_media.youtube}", class: 'youtube'
  end

  def link_to_soundcloud
    link_to 'SoundCloud', "https://soundcloud.com/#{data_social_media.soundcloud}", class: 'soundcloud'
  end

  def link_to_instagram
    link_to 'Instagram', "https://www.instagram.com/#{data_social_media.instagram}/", class: 'instagram'
  end

  def data_social_media
    data.config.social_media
  end
end
