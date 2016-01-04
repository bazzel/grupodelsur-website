module I18nHelpers

  def i18n(object, attr)
    value = object[[attr, I18n.locale].join('_').camelize(:lower)]

    value ||= object[attr]
  end

  def local_path(path)
    if I18n.locale == I18n.default_locale
      "/#{path}"
    else
      "/#{I18n.locale}/#{t(path, scope: :paths)}"
    end
  end
end
