# frozen_string_literal: true

require 'spec_helper'

module Jekyll
  RSpec.describe(LiquifyFilter) do
    let(:overrides) do
      {
        'source' => source_dir,
        'destination' => dest_dir,
        'url' => 'http://example.org'
      }
    end

    let(:config) { Jekyll.configuration(overrides) }
    let(:site) { Jekyll::Site.new(config) }
    let(:contents) { File.read(dest_dir('index.html')) }

    before { site.process }

    context 'when the `liquify` filter is used' do
      it 'parses Liquid in the front matter' do
        expect(contents).to match(/The first president of the United States was George Washington./)
      end

      it 'does not match first president' do
        expect(contents).not_to match(/The first president of the United States was {{ page.first_president }}./)
      end
    end

    context 'when the `liquify` filter is not used' do
      it 'does not parse Liquid in the front matter' do
        expect(contents).to match(/The second president of the United States was {{ page.second_president }}./)
      end

      it 'does not match the second president' do
        expect(contents).not_to match(/The second president of the United States was John Adams./)
      end
    end

    context 'when it is used in conjunction with the `markdownify` filter' do
      it 'works with markdownify first' do
        expect(contents).to match(/Google’s URL is \*\*Hello\*\*/)
      end

      it 'does not work with markdownify second' do
        expect(contents).to match(%r{Visit google at <strong>Hello</strong>})
      end
    end
  end
end
