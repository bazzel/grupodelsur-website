module I18nHelpers

  def i18n(object, attr)
    value = object[[attr, I18n.locale].join('_').camelize(:lower)]

    value ||= object[attr]
  end
end
