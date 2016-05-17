module I18nHelpers

  def i18n(object, attr)
    value = object[[attr, I18n.locale].join('_').camelize(:lower)]

    value ||= object[attr]
  end

  def local_path(path, locale = I18n.locale)
    if is_default_locale?(locale)
      "/#{path}"
    else
      "/#{I18n.locale}/#{I18n.t(path, scope: :paths)}"
    end
  end

  def locale_links
    return unless file_is_localizable?

    with_locales do |text, locale|
      path = File.basename(current_resource.target, current_resource.ext)
      text << content_tag(:li, locale_link(locale, path))
    end
  end

  def locale_links_for_template(path, instance, slug_field)
    with_locales do |text, locale|
      filename = I18n.with_locale(locale) { i18n(instance, slug_field) }
      text << content_tag(:li, "#{locale_link(locale, path, filename)}")
    end
  end

  def locale_link(locale, path, filename=nil)
    classname = "flag-icon-#{locale}"

    if is_current_locale?(locale)
      content_tag(:span, locale, class: [classname, 'active'].join(' '))
    else
      I18n.with_locale(locale) do
        url = [local_path(path), filename].compact.join('/')
        link_to(locale, url, class: classname)
      end
    end
  end

  def with_locales
    content = langs.reduce('') { |text, locale| yield(text, locale) }

    content_tag(:ul, content, class: 'locale-links')
  end

  def file_is_localizable?
    current_resource.source_file =~ /(localizable|templates)/
  end

  def is_current_locale?(locale)
    locale == I18n.locale
  end

  def is_default_locale?(locale)
    locale == I18n.default_locale
  end
end
