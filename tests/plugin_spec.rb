# frozen_string_literal: true

require 'json'

# This plugin's tests, run with `./bin/trmnlp test` (add `--report report` for a page of every screen it drew).
# Docs: https://github.com/usetrmnl/trmnlp#testing-plugins
RSpec.describe 'Example Plugin' do
  let(:sample_data) do
    JSON.parse(File.read(File.expand_path('../assets/demo/sample-data.json', __dir__)))
  end

  # Canned answers for the requests the plugin makes, its polling urls and its transform's own.
  let(:mocks) do
    {
      'https://trmnl.com/custom_plugin_example_data.json' => {
        json: sample_data
      }
    }
  end

  # The values of the custom fields in src/settings.yml to test with.
  let(:custom_fields) do
    {
      'show_details' => true,
      'custom_title' => 'Example Plugin'
    }
  end

  # Every view on TRMNL's devices, a failing API and every select option, checked for page errors and leaked values.
  it_behaves_like 'a publishable recipe'

  context 'with sample data' do
    it 'renders the example metric and status without overflow or problems' do
      screen = trmnl.render(view: 'full', mocks:, custom_fields:)
      expect(screen).to have_text('Example Value')
      expect(screen).to have_text('42')
      expect(screen).to have_no_overflow
      expect(screen).to have_no_problems
    end
  end
end
