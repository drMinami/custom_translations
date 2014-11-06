require "custom_translations/version"
require "active_support/all"

module I18n::Backend
  class Simple
    def stored_translations
      init_translations unless initialized?
      translations
    end
  end
end

module CustomTranslations
  cattr_accessor :blacklist_keys
  self.blacklist_keys = [
    :date,
    :time,
    :datetime,
    :number,
    :errors,
    :helpers,
    :support,
    :activerecord
  ]

  cattr_accessor :path

  def self.import(data)
    data.each do |locale, dict|
      I18n.backend.store_translations(locale, dict)
    end

    File.write(path, YAML.dump(data))
  end

  def self.export
    Hash[I18n.backend.stored_translations.map do |locale, translations|
      [ locale, translations.except(*blacklist_keys) ]
    end]
  end
end
