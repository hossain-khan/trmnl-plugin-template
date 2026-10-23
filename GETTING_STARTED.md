# Getting Started with This Template

This guide walks you through setting up your TRMNL Private Plugin or Recipe using this template and **[TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4)**.

## Step 1: Clone the Repository

Clone this repository as a starting point for your plugin.

## Step 2: Customize Configuration Files

### Update [`settings.yml`](settings.yml)

1. Choose your plugin's **strategy** ([Plugin Strategies Guide](https://help.trmnl.com/en/articles/17434705-plugin-strategies)):
   - `polling` — TRMNL fetches 1 or more newline-separated URLs (`polling_url`, `polling_verb`, `polling_headers`, `polling_body`)
   - `webhook` — Your service POSTs `{"merge_variables": {...}}` to TRMNL's webhook URL (max 5KB, 10KB on TRMNL+)
   - `plugin_merge` — Combines data already fetched by other plugins on your account
   - `static` — Uses JSON defined in `static_data`
   - `async_polling` — Server responds HTTP 202 and POSTs to `{{ callback_url }}` within 15 minutes
   - `none` — Uses only `trmnl.*` globals or client-side JS

2. Configure your `polling_url` and `refresh_interval`:
   ```yaml
   name: My Cool Plugin
   description: Displays metrics from my service
   framework_version: "3.4.0"
   strategy: polling
   refresh_interval: 15
   polling_url: "https://api.example.com/v1/stats"
   polling_verb: GET
   polling_headers: "authorization=Bearer {{ api_key }}"
   no_screen_padding: 'no'
   dark_mode: 'no'
   ```

3. Configure your **Custom Form Fields** under `custom_fields:` in [`settings.yml`](settings.yml) (or see [`custom-fields.yml`](custom-fields.yml) for more examples):
   ```yaml
   custom_fields:
     - keyname: about
       name: About This Plugin
       field_type: author_bio
       category: productivity
       description: Displays live metrics on your TRMNL device.
       github_url: https://github.com/your-username/your-plugin

     - keyname: api_key
       field_type: password
       name: API Key
       description: Get your key from example.com/settings
       optional: false

     - keyname: units
       field_type: select
       name: Units
       options:
         - Metric
         - Imperial
       default: metric
       optional: true
   ```
   > **Important Form Builder Rules**:
   > - Required keys for every field: `keyname`, `field_type`, `name`
   > - All fields are **required by default** unless `optional: true` is added
   > - `select` option values are always stored **lowercase** (`{{ trmnl.plugin_settings.custom_fields_values.units }}` → `"metric"`)

## Step 3: Edit Template Files ([`templates/`](templates/))

### Hard Rules for ePaper Templates
- **Never wrap markup in `<div class="view">`**: The TRMNL platform provides `<div class="screen"><div class="view view--*">` automatically. Start your template with `<div class="layout ...">`.
- **`<div class="layout">` and `<div class="title_bar">` must be siblings**.
- **No inline `style="..."` or `<style>` blocks**: Use Framework 3.4 utility classes (`stretch`, `grid`, `col--span-*`, `flex`, `gap--*`).
- **No emojis**: ePaper fonts do not include emojis (they render as empty boxes `□`). Use text labels, semantic badges (`label--success`, `label--warning`, `label--error`), or inline SVGs with `image--adaptive`.

### 1. [`templates/shared.liquid`](templates/shared.liquid)
Runs before any view template. Define shared variables, inline 24×24 SVG icons, and reusable `{% template %}` blocks:

```liquid
{% template my_metric %}
<div class="item">
  <div class="meta"></div>
  <div class="content">
    <span class="value value--large value--tnums" data-fit-value="true">{{ value }}</span>
    <span class="label">{{ label }}</span>
  </div>
</div>
{% endtemplate %}
```

Render partials in any view template by the template block's name:
```liquid
{% render "my_metric", value: 42, label: "Active Users" %}
```

### 2. Adapt Across All 4 View Sizes
- **[`templates/full.liquid`](templates/full.liquid) (`800×480`, ~320px content height)**: Full canvas — use 12-col `grid` with `col--span-*` or `grid--cols-3`.
- **[`templates/half_horizontal.liquid`](templates/half_horizontal.liquid) (`800×240`, ~144px content height)**: Wide banner (top/bottom of `1Tx1B` mashup) — arrange blocks horizontally side-by-side (`layout--row`, `grid`).
- **[`templates/half_vertical.liquid`](templates/half_vertical.liquid) (`400×480`, ~368px content height)**: Narrow column (left/right of `1Lx1R` mashup) — stack content vertically (`layout--col`).
- **[`templates/quadrant.liquid`](templates/quadrant.liquid) (`400×240`, ~144px content height)**: Postcard (`2×2` mashup) — show only the single most important metric.

## Step 4: Test & Preview

### Option A: Local Development with `trmnlp`
Install [`trmnlp`](https://github.com/usetrmnl/trmnlp) (via Docker or RubyGems `gem install trmnl_preview`) to preview and lint locally:
```bash
trmnlp serve   # Live preview at http://localhost:4567
trmnlp lint    # Validate against TRMNL best practices
```

### Option B: TRMNL Web Markup Editor
1. Create a Private Plugin in the [TRMNL Dashboard](https://trmnl.com)
2. Paste your form fields from [`custom-fields.yml`](custom-fields.yml) and configure your strategy
3. Copy each `.liquid` file into its corresponding tab (`Full`, `Half Horizontal`, `Half Vertical`, `Quadrant`, `Shared`)
4. Click **Force Refresh** to fetch data and test across devices, bit-depths, and Framework 3.4 themes

## Useful Variables & Filters

### TRMNL Global Variables (`{{ trmnl }}`)
```liquid
<!-- User info & localization -->
{{ trmnl.user.first_name }}
{{ trmnl.user.locale }}
{{ trmnl.user.time_zone_iana }}
{{ trmnl.user.utc_offset }}

<!-- Plugin settings & custom fields -->
{{ trmnl.plugin_settings.instance_name }}
{{ trmnl.plugin_settings.custom_fields_values.api_key }}

<!-- Device info -->
{{ trmnl.device.model }}
{{ trmnl.device.bit_depth }}
{{ trmnl.device.width }}
{{ trmnl.device.height }}
{{ trmnl.device.orientation }}
```

### Advanced Liquid & TRMNL Custom Filters
See [Advanced Liquid](https://help.trmnl.com/en/articles/10693981-advanced-liquid) and [Custom Plugin Filters](https://help.trmnl.com/en/articles/10347358-custom-plugin-filters):
```liquid
<!-- Convert UTC ISO8601 date to user's local timezone -->
{{ timestamp | date: "%s" | plus: trmnl.user.utc_offset | date: "%H:%M" }}

<!-- Localized word & date -->
{{ 'updated' | l_word: trmnl.user.locale }}
{{ '2025-01-11' | l_date: '%y %b', trmnl.user.locale }}

<!-- Numbers & currency -->
{{ 1234567 | number_with_delimiter }}
{{ 10420 | number_to_currency }}
{{ 1.0 | divided_by: count | round: 2 }}

<!-- Random numbers & unique IDs for Mashups -->
{% assign rand = "" | random_number: 1, 10 %}
{% assign chart_id = "chart-" | append_random %}

<!-- JSON serialization for JS -->
const data = {{ payload | json }};
```

## Need Help?

- [TRMNL Framework 3.4 Docs](https://trmnl.com/framework/docs/3.4)
- [Private Plugins Guide](https://help.trmnl.com/en/articles/9510536-private-plugins)
- [Custom Plugin Form Builder](https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder)
- [Advanced Liquid Guide](https://help.trmnl.com/en/articles/10693981-advanced-liquid)
- [`.github/copilot-instructions.md`](.github/copilot-instructions.md)
