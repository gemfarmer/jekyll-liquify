require 'spec_helper'

describe(Jekyll) do
  let(:overrides) do
    {
      "source"      => source_dir,
      "destination" => dest_dir,
      "url"         => "http://example.org",
    }
  end
  let(:config) do
    Jekyll.configuration(overrides)
  end
  let(:site)     { Jekyll::Site.new(config) }
  let(:contents) { File.read(dest_dir("index.html")) }

  before(:each) do
    site.process
  end

  context 'the `liquify` filter is used' do
    it "parses Liquid in the front matter" do
      expect(contents).to match /The first president of the United States was George Washington./
      expect(contents).to_not match /The first president of the United States was {{ page.first_president }}./
    end
  end

  context 'the `liquify` filter is not used' do
    it "does not parse Liquid in the front matter" do
      expect(contents).to match /The second president of the United States was {{ page.second_president }}./
      expect(contents).to_not match /The second president of the United States was John Adams./
    end
  end

  context "it is used in conjunction with the `markdownify` filter" do
    it 'works with markdownify first' do
      expect(contents).to match /Google’s URL is \*\*Hello\*\*/
    end

    it 'does not work with markdownify second' do
      expect(contents).to match /Visit google at <strong>Hello<\/strong>/
    end
  end
 end
