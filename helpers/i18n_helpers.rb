module I18nHelpers

  def i18n(object, attr)
    value = object[[attr, I18n.locale].join('_').camelize(:lower)]

    value ||= object[attr]
  end

  def local_path(path, locale = I18n.locale)
    if locale == I18n.default_locale
      "/#{path}"
    else
      "/#{I18n.locale}/#{I18n.t(path, scope: :paths)}"
    end
  end

  def locale_links
    return unless file_is_localizable?

    content = langs.reduce('') do |text, locale|
      text << content_tag(:li, locale_link(locale, current_page))
    end

    locale_links_wrapper { content }
  end

  def locale_links_wrapper
    content_tag(:ul, yield, class: 'locale-links')
  end

  def locale_link(locale, current_page)
    classname = "flag-icon-#{locale}"

    if locale == I18n.locale
      content_tag(:span, locale, class: [classname, 'active'].join(' '))
    else
      I18n.with_locale(locale) do
        path = File.basename(current_page.target, current_page.ext)
        link_to(locale, local_path(path), class: classname)
      end
    end
  end

  def file_is_localizable?
    current_page.target =~ /[localizable|templates]/
  end
end
