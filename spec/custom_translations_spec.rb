require "spec_helper"
require "custom_translations"

describe CustomTranslations do
  before(:all) do
    I18n.load_path = ['spec/support/translations.yml']
    CustomTranslations.path = 'spec/support/custom_translations.yml'
    CustomTranslations.blacklist_keys << :devise
  end

  describe '.export' do
    it 'excludes blacklisted keys' do
      expect(CustomTranslations.export).to match_array({
        en: {
          quux: 'quux',
          foo: 'foo',
          bar: 'bar',
          baz: 'baz'
        }
      })
    end
  end

  describe '.import' do
    it 'dumps dictionary to file' do
      CustomTranslations.import({
        en: {
          quux: 'quux',
          foo: 'foo',
          bar: 'bar',
          baz: 'baz'
        }
      })

      contents = "---\n:en:\n  :quux: quux\n  :foo: foo\n  :bar: bar\n  :baz: baz\n"

      expect(File.read(CustomTranslations.path)).to eq(contents)
    end
  end
end
