# Jekyll Liquify

A Jekyll filter that can parse Liquid in front matter

[![Gem Version](https://img.shields.io/gem/v/jekyll-liquify.svg)](https://rubygems.org/gems/jekyll-liquify)

[![Rubocop](https://github.com/kigster/jekyll-liquify/actions/workflows/rubocop.yml/badge.svg)](https://github.com/kigster/jekyll-liquify/actions/workflows/rubocop.yml)

[![RSpec](https://github.com/kigster/jekyll-liquify/actions/workflows/ruby.yml/badge.svg)](https://github.com/kigster/jekyll-liquify/actions/workflows/ruby.yml)

## Usage

1. Add `gem 'jekyll-liquify'` to your site's Gemfile and run `bundle`
2. Add the following to your site's `_config.yml`:

```yml
gems:
  - jekyll-liquify
```

To use in your project, add liquid tags to front matter and use the `liquify` filter to parse it:

**example.md**

```
---
title: Welcome to {{ page.title_variable }}
title_variable: example
---

# Welcome to {{ title | liquify }}!

<!-- This will output the following -->
>> <h1>Welcome to example!</h1>
```

You can use it in conjunction with `markdownify`, but `liquify` has to go first:

**example.md**

```
---
title: Welcome to **{{ page.title_variable }}**
title_variable: example
---

# Welcome to {{ title | liquify | markdownify }}!

<!-- This will output the following -->
>> <h1>Welcome to <strong>example</strong>!</h1>
```

## Testing

1. `script/bootstrap`
2. `script/cibuild`

## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request
