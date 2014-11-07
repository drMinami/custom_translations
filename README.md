# CustomTranslations

I18n locales overriding via single file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'custom_translations'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install custom_translations

## Usage

Initializer:
```ruby
# config/initializers/custom_translations.rb
CustomTranslations.path = Rails.root.join('config/locale/custom_translations.yml')
CustomTranslations.blacklist_keys += [ :devise, :simple_form ]

# config/application.rb
config.i18n.load_path += Dir[
  Rails.root.join('/config/locales/**/*.yml'),
  Rails.root.join('/config/locales/custom_translations.yml')
]
```

Example usage:
```ruby
# Dump translations.
translations = CustomTranslations.export

# Read from JSON.
CustomTranslations.import(JSON.parse(params[:translations]))
```

## License

Copyright (c) 2014 Zakharov Ivan

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
