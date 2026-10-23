# TRMNL Plugin - Copilot Instructions Template

> **Note**: This is a generic template for TRMNL plugin projects. Replace placeholders with your project-specific information.

> **Repository**: [your-username/your-repo-name](https://github.com/your-username/your-repo-name)  
> **Author**: Your Name  
> **Framework Version**: [TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4)  
> **Last Updated**: [Current Date]

## Project Overview

[Provide a brief description of what your TRMNL plugin does, its key features, and the value it provides to users]

### Key Goals

1. **[Goal 1]**: [Description]
2. **[Goal 2]**: [Description]
3. **[Goal 3]**: [Description]

### Current Status

[Describe the current state of the project - what's complete, what's in progress, what's planned]

## Getting Started

For developers working on this project:

1. **Understand the Project**: Read this file completely for comprehensive context
2. **Review Documentation**:
   - `README.md` - Project overview and installation
   - `GETTING_STARTED.md` - Step-by-step setup guide
3. **Test Templates**: Preview layouts using [`trmnlp`](https://github.com/usetrmnl/trmnlp) (`trmnlp serve` / `trmnlp lint`) or in the TRMNL Markup Editor
4. **Review Framework**: Familiarize yourself with [TRMNL Framework 3.4 Docs](https://trmnl.com/framework/docs/3.4)

## Project Structure

```
your-plugin-name/
├── .github/                      # GitHub configuration
│   ├── workflows/               # GitHub Actions (if applicable)
│   ├── copilot-instructions.md  # This file
│   └── TEMPLATE_USAGE.md        # Instructions for using the template
├── assets/                       # Design assets
│   ├── icon/                    # Plugin icons
│   └── demo/                    # Demo screenshots & sample-data.json
├── templates/                    # Template layouts (uploaded to TRMNL or moved to src/ for trmnlp)
│   ├── full.liquid              # Full-screen layout (800x480 / 1040x780)
│   ├── half_horizontal.liquid   # Top or bottom half of a 1Tx1B mashup (800x240)
│   ├── half_vertical.liquid     # Left or right half of a 1Lx1R mashup (400x480)
│   ├── quadrant.liquid          # Quarter-size 2x2 mashup layout (400x240)
│   └── shared.liquid            # Reusable templates, variables, and inline SVG assets
├── settings.yml                  # Plugin configuration & custom_fields (uploaded to TRMNL)
├── custom-fields.yml             # Reference custom form fields YAML for the TRMNL UI
├── LICENSE                       # License file
└── .gitignore                    # Git ignore patterns
```

> **Note on `trmnlp` & GitHub Sync**: When using the official [`trmnlp`](https://github.com/usetrmnl/trmnlp) CLI or [TRMNL GitHub Sync](https://help.trmnl.com/en/articles/15977899-github-sync), `settings.yml` and the `.liquid` files (plus optional `transform.{js,py,rb,php}`) live inside a `src/` directory alongside a root `.trmnlp.yml` file. When exporting/importing a plugin `.zip` archive, `settings.yml` and the `.liquid` files sit in a flat root directory.

## Hard Rules for TRMNL ePaper Markup (NON-NEGOTIABLE)

1. **No Custom Styles (`style="..."` or `<style>` blocks)**:
   - Never use inline `style="..."` attributes or `<style>` blocks for layout, colors, spacing, or sizing. Use TRMNL Framework 3.4 utility classes (`stretch`, `grow`, `w--full`, `grid`, `col--span-*`, `bg--*`, `text--*`).
   - Only exception: JavaScript libraries that manage their own DOM (`Highcharts`/`Chartkick` via `TRMNLCharts`, `MapLibre GL JS` via `TRMNLMaps`).
2. **No Emojis in Markup**:
   - ePaper displays have **no emoji font support** — emojis (`⚙️`, `📊`, `⚠️`) render as missing glyph boxes (`□`) on hardware. Use text labels, semantic badges (`label--success`, `label--warning`, `label--error`), or inline SVGs with `image--adaptive`.
3. **Never Wrap Markup in `<div class="view">`**:
   - The TRMNL platform automatically provides `<div class="screen"><div class="view view--*">`.
   - Your template must start directly with `<div class="layout ...">` followed by its sibling `<div class="title_bar">`.
4. **Always Add `image-dither` to Content Images**:
   - Use `<img class="image image-dither" src="...">` on photos and complex raster images so Floyd-Steinberg dithering is applied.
   - For monochrome silhouette icons (including in `.title_bar`), use `<img class="image image--adaptive" src="...">` instead of `image-dither`.
5. **Proportional Splits Use `grid`, Not `flex`**:
   - Use 12-column `grid` with `col--span-{N}` (e.g., `col--span-8` + `col--span-4`) or `grid--cols-{N}` for proportional splits, never `flex` with percentage widths.

---

## TRMNL Framework 3.4

**Documentation**: [https://trmnl.com/framework/docs/3.4](https://trmnl.com/framework/docs/3.4) • **Source**: [github.com/usetrmnl/trmnl-framework](https://github.com/usetrmnl/trmnl-framework)

### What's New in Framework v3.0 – v3.4

| Version | Highlights |
| ------- | ---------- |
| **3.0** | Chromatic color palette (10 hues × 14 steps), semantic roles (`primary`, `success`, `warning`, `error`), 14-step linear grayscale (`gray-10` to `gray-75`), CSS variable architecture |
| **3.1** | TRMNL pixel fonts (`TRMNL12`, `TRMNL16`, `TRMNL21`) default on low-density screens, `mashup--3x3` fluid mashups, `inverse` class, independent `Text Scale` and `Scale` modifiers |
| **3.2** | Open-source release, **Themes** (`screen--theme-*`), **`TRMNLPaint`** JS Paint API, **`TRMNLCharts`** adaptive Highcharts adapter, **`image--adaptive`** monochrome icon recoloring, shade-step borders (`border--h-10` to `border--h-75`, deprecating `border--h-1`..`7`) |
| **3.3** | **`TRMNLMaps`** adaptive MapLibre GL JS vector maps, position utilities (`relative`, `absolute`, `top--*`, `z--0`..`3`), `outline--muted`, extended theme slots |
| **3.4** | Custom theme typefaces (`typeface` class / `--framework-typeface`), complete unclipped card borders |

### Device Specifications & View Dimensions

| View File | Mashup Role | OG Dimensions | Usable Content Height | Primary Axis Strategy |
| --------- | ----------- | ------------- | --------------------- | --------------------- |
| `full.liquid` | Full screen | 800×480 | ~320px | Canvas: 2–3 zones via `grid` (`col--span-*`) or `layout--col` |
| `half_horizontal.liquid` | Top or bottom half (`1Tx1B`) | 800×240 | ~144px | Wide banner: **columnize horizontally** (`layout--row`, `grid--cols-*`) |
| `half_vertical.liquid` | Left or right half (`1Lx1R`) | 400×480 | ~368px | Narrow column: **stack vertically** (`layout--col`) |
| `quadrant.liquid` | One quarter (`2x2`) | 400×240 | ~144px | Postcard: **pick ONE key metric** (`layout--center`) |

> **Note**: V2/TRMNL X renders at `1040×780` (4-bit, 16 shades), TRMNL OG V2 at `800×480` (2-bit, 4 shades), TRMNL OG at `800×480` (1-bit, 2 shades), and color ePaper devices (e.g. B/W/R/Y) render chromatic tokens automatically. See [Device Models API](https://trmnl.com/api/models) and [Framework Devices Docs](https://trmnl.com/framework/docs/3.4/devices).

### Responsive System

1. **Size-Based Breakpoints (Mobile-First Progressive)**:
   - `sm:` — 600px+ (Kindle devices)
   - `md:` — 800px+ (TRMNL OG, OG V2)
   - `lg:` — 1024px+ (TRMNL X)
2. **Bit-Depth Variants (Specific, Non-Progressive)**:
   - `1bit:` — Monochrome (2 shades)
   - `2bit:` — Grayscale (4 shades)
   - `4bit:` — Grayscale (16 shades)
   - `8bit:` — Grayscale (256 shades)
3. **Orientation Modifiers**:
   - `portrait:` — Portrait orientation
   - `landscape:` — Landscape orientation (default)
4. **Combined Pattern**: `size:orientation:bit-depth:utility` (e.g., `md:portrait:4bit:grid--cols-2`)
5. **Container Query Units**: `w--[22cqw]`, `h--[40cqh]` scale relative to the view container inside mashups.

### Color System & 14-Step Grayscale (Framework 3.4)

- **14-Step Grayscale**: `black` → `gray-10`, `gray-15`, `gray-20`, `gray-25`, `gray-30`, `gray-35`, `gray-40`, `gray-45`, `gray-50`, `gray-55`, `gray-60`, `gray-65`, `gray-70`, `gray-75` → `white`.
  - Usage: `bg--gray-30`, `text--gray-50`, `label--gray`, `label--gray-40`, `border--h-45`.
  - *Note*: Do not put both `bg--*` and a pattern `text--gray-N` on the **same** HTML element; put `bg--*` on the container and `text--gray-N` on an inner `<span>`.
- **Chromatic Palette (10 Hues × 14 Steps)**:
  - Hues: `red`, `orange`, `yellow`, `lime`, `green`, `cyan`, `blue`, `violet`, `purple`, `pink`
  - Usage: `bg--red`, `bg--blue-40`, `text--green-30` (automatically falls back to LAB perceptual grayscale on monochrome panels).
- **Semantic Roles & Label Variants**:
  - Backgrounds & Text: `bg--primary`, `bg--success`, `bg--warning`, `bg--error`, `text--primary`, `text--success`, `text--warning`, `text--error`
  - Labels: `label--primary`, `label--success`, `label--warning`, `label--error`, `label--inverted`, `label--outline`, `label--underline`, `label--gray`
- **Inverse Container Modifier**:
  - Add `inverse` to a container (`<div class="item inverse">`) to flip it to dark-on-light (or light-on-dark in dark mode), compatible with all bit-depths and themes.

### Core Utilities & Components

#### 1. Foundation Structure (`layout` + `title_bar`)
```liquid
<div class="layout layout--col gap--space-between">
  <!-- Content organized with grid, flex, or columns -->
</div>

<div class="title_bar">
  <img class="image image--adaptive" src="https://trmnl.com/images/plugins/trmnl--render.svg" alt="Plugin">
  <span class="title">{{ trmnl.plugin_settings.instance_name }}</span>
  <span class="instance">Instance</span>
</div>
```
- **Layout Direction & Alignment**: `layout--col` (default), `layout--row`, `layout--left`, `layout--center-x`, `layout--right`, `layout--top`, `layout--center-y`, `layout--bottom`, `layout--center`, `layout--start`, `layout--end`, `layout--justify-*`, `layout--align-*`
- **Layout Stretch**: `layout--stretch`, `layout--stretch-x`, `layout--stretch-y`, `layout--stretch-main`, `layout--stretch-cross`; child stretch: `stretch`, `stretch-x`, `stretch-y`

#### 2. Grid, Flex, and Columns
- **Grid** (default 12-column or explicit `grid--cols-1`..`grid--cols-12`):
  - Proportional splits: `col--span-6` + `col--span-6` (50/50), `col--span-8` + `col--span-4` (⅔ + ⅓), `col--span-9` + `col--span-3` (¾ + ¼)
  - Equal columns: `<div class="grid grid--cols-3 gap--medium">`
- **Flex**:
  - `flex flex--row`, `flex--col`, `flex--wrap`, `flex--left`, `flex--right`, `flex--center`, `flex--center-x`, `flex--center-y`, `flex--top`, `flex--bottom`, `flex--between`, `flex--around`, `flex--evenly`
  - Child utilities: `stretch-x`, `stretch-y`, `grow`, `no-shrink`, `self--start`, `self--center`, `self--end`, `self--stretch`
- **Columns** (auto-distributing lists):
  - Always put **all** `.item` elements inside a **single** `.column` child inside `.columns`; let the overflow engine distribute columns:
    ```liquid
    <div class="columns" data-overflow-max-cols="2">
      <div class="column">
        {% for item in items %}
          <div class="item">...</div>
        {% endfor %}
      </div>
    </div>
    ```

#### 3. Typography Elements
- **Value**: `value--xxsmall`, `value--xsmall`, `value--small`, `value--base` (or `value`), `value--large`, `value--xlarge`, `value--xxlarge`, `value--xxxlarge`, `value--mega`, `value--giga`, `value--tera`, `value--peta`
  - Modifiers: `value--tnums` (tabular numbers), `data-fit-value="true"` (auto-scale), `data-value-format="true"` / `data-value-type="number"`
- **Title**: `title--small`, `title--base` (or `title`), `title--large`, `title--xlarge`, `title--xxlarge`
- **Label**: `label--small`, `label--base` (or `label`), `label--large`, `label--xlarge`, `label--xxlarge`
  - Variants: `label--gray`, `label--outline`, `label--underline`, `label--inverted`, `label--filled`, `label--primary`, `label--success`, `label--warning`, `label--error`
- **Description**: `description--base` (or `description`), `description--large`, `description--xlarge`, `description--xxlarge`

#### 4. The `.item` Component
Always include `<div class="meta"></div>` (even when empty):
```liquid
<div class="item">
  <div class="meta">
    <span class="index">1</span>
  </div>
  <div class="content">
    <span class="title title--small" data-clamp="1">Heading</span>
    <span class="description" data-clamp="2">Supporting text</span>
  </div>
</div>
```

#### 5. Borders, Outlines, Dividers, Position, and Images
- **Divider**: `<div class="divider"></div>`
- **Borders (v3.2+ shade steps)**: `border`, `border--h`, `border--v`, `border--top`, `border--h-10` through `border--h-75`, `border--h-black`, `border--h-white` (*Note*: `border--h-1`..`7` are deprecated)
- **Outlines**: `outline` (pixel-perfect rounded border), `outline--muted` (mid-gray edge)
- **Position Utilities (v3.3+)**: `relative`, `absolute`, `top--2`, `right--2`, `bottom--2`, `left--2`, `inset--0`, `z--0` through `z--3`
- **Images & Strokes**:
  - Content photos: `<img class="image image--contain image-dither" src="...">`
  - Monochrome icons: `<img class="image image--adaptive" src="...">`
  - Overlaid text/image strokes: `text-stroke text-stroke--medium`, `image-stroke image-stroke--large`

#### 6. Runtime Engines (Data Attributes)
- **Clamp**: `data-clamp="1"`, `data-clamp="2"`, responsive `data-clamp-lg="3"`
- **Fit Value**: `data-fit-value="true"` (or `data-value-fit="true"`), `data-value-fit-max-height="220"`
- **Format Value**: `data-value-format="true"`, `data-value-type="number"`, `data-value-locale="en-US"`
- **Overflow**: `data-overflow="true"`, `data-overflow-max-cols="3"`, `data-overflow-counter="true"`, `data-overflow-max-height="auto"` (replaces legacy `data-list-limit`, `data-list-max-columns`, `data-list-hidden-count`)
- **Table Overflow**: `<table class="table" data-table-limit="true" data-table-overflow-counter="false">`
- **Content Limiter**: `<div class="content" data-content-limiter="true" data-content-max-height="140">`
- **Progress**: `<div class="progress-bar" data-progress="75"></div>` and `<div class="progress-dots" data-progress="3" data-progress-total="5"></div>`

#### 7. Adaptive Charts (`TRMNLCharts`), Maps (`TRMNLMaps`), and `TRMNLPaint`
- **Charts (`TRMNLCharts`)**: Always build Highcharts or Chartkick inside `TRMNLCharts.watch(el, fn)`, merge options with `TRMNLCharts.merge(TRMNLCharts.options({ el }), { ... })`, color series via `TRMNLCharts.series(i, n, { el })`, and scale pixel sizes via `TRMNLPaint.px(val, { el })`. See [Chart Docs](https://trmnl.com/framework/docs/3.4/chart).
- **Maps (`TRMNLMaps`)**: Build MapLibre GL JS vector maps inside `TRMNLMaps.watch(el, fn)` with `TRMNLMaps.options({ el, preset: "streets", center, zoom })`. See [Map Docs](https://trmnl.com/framework/docs/3.4/map).

---

## Advanced Liquid & Custom TRMNL Filters

**References**:
- [Advanced Liquid Guide](https://help.trmnl.com/en/articles/10693981-advanced-liquid)
- [Custom Plugin Filters](https://help.trmnl.com/en/articles/10347358-custom-plugin-filters)
- [Liquid 101 Guide](https://help.trmnl.com/en/articles/10671186-liquid-101)

### 1. Time Zones & Localization
- **Convert UTC timestamps to user's local timezone in Liquid**:
  ```liquid
  {{ "2025-02-28T13:35:00Z" | date: "%s" | plus: trmnl.user.utc_offset | date: "%H:%M" }}
  ```
- **Localized "Updated at" timestamp**:
  ```liquid
  {{ 'updated' | l_word: trmnl.user.locale }} {{ "now" | date: "%s" | plus: trmnl.user.utc_offset | date: "%H:%M" }}
  ```
- **Localized dates (`l_date`)**:
  ```liquid
  {{ '2025-01-11' | l_date: '%y %b', trmnl.user.locale }}
  ```
- **Dates & Times in JavaScript**:
  ```html
  <script>
    const date = new Date("2025-06-09T17:00:00Z");
    const timeZone = "{{ trmnl.user.time_zone_iana }}";
    const locale = "{{ trmnl.user.locale }}";
    const formatted = date.toLocaleString(locale, {
      hour: 'numeric',
      minute: '2-digit',
      hour12: true,
      timeZone,
      timeZoneName: 'short'
    });
  </script>
  ```

### 2. Numbers, Strings, and Math
- **Force float division**: `{{ 1.0 | divided_by: count | round: 2 }}` (integer division `{{ 1 | divided_by: 2 }}` returns `0`).
- **Delimiters & Currency**:
  - `{{ 1234567 | number_with_delimiter }}` → `1,234,567`
  - `{{ 10420 | number_to_currency }}` → `$10,420.00`
  - `{{ 1234.57 | number_to_currency: 'en-GB' }}` → `£1234.57`
- **Left-padding strings (e.g. `01:03`)**:
  ```liquid
  {% assign hours = hours | prepend: "00" | slice: -2, 2 %}
  ```
- **Random Numbers & Sampling**:
  - `{% assign rnum = "" | random_number: 1, 10 %}`
  - `{{ csv_list | split: ',' | sample | strip }}`
- **Pluralization & Markdown**:
  - `{{ "item" | pluralize: count }}`
  - `{{ markdown_text | markdown_to_html }}`
- **Dates (`days_ago`, `ordinalize`)**:
  - `{{ 7 | days_ago }}`
  - `{{ "2025-10-02" | ordinalize: "%A, %B <<ordinal_day>>, %Y" }}`
- **QR Codes**:
  - `{{ "https://trmnl.com" | qr_code }}`

### 3. Collections & JSON Filters
- **Serialize to JSON for JS**: `const data = {{ my_object | json }};`
- **Parse nested JSON string**: `{% assign parsed = raw_json_string | parse_json %}`
- **Collection querying**:
  - `{{ items | group_by: "category" }}`
  - `{{ items | find_by: "name", "Ryan", "Not Found" }}`
  - `{{ items | where_exp: "item", "item.count >= 3" }}`

### 4. Mixing Liquid & JavaScript Safely
- **Wrap client-side DOM mutations in `DOMContentLoaded`** (more reliable than `window.onload` in TRMNL's screenshot pipeline):
  ```html
  <script>
    document.addEventListener("DOMContentLoaded", function(e) {
      // client-side code here
    });
  </script>
  ```
- **Prevent ID collisions in Mashups with `append_random`**:
  ```liquid
  {% assign chart_id = "chart-" | append_random %}
  <div id="{{ chart_id }}" class="w--full"></div>
  ```

---

## Private Plugins & Data Strategies

**References**:
- [Private Plugins Guide](https://help.trmnl.com/en/articles/9510536-private-plugins)
- [Plugin Strategies](https://help.trmnl.com/en/articles/17434705-plugin-strategies)
- [Custom Plugin Form Builder](https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder)

### Supported Strategies (`settings.yml`)
1. **`polling`**: TRMNL fetches 1 or more newline-separated URLs (`polling_url`, `polling_verb: GET|POST`, `polling_headers`, `polling_body`).
   - Single URL: fields merge into root (`{{ field }}`, or `{{ data[0] }}` for root arrays).
   - Multiple URLs: available as `{{ IDX_0.field }}`, `{{ IDX_1.field }}`, etc.
   - Supports Liquid interpolation of custom fields (`{{ api_key | url_encode }}`) and globals (`{{ trmnl.user.first_name }}`).
   - Whitelist TRMNL server IPs via [https://trmnl.com/api/ips](https://trmnl.com/api/ips).
2. **`webhook`**: External service POSTs `{"merge_variables": {...}}` to TRMNL's webhook URL (max 5KB stored payload, or 10KB with TRMNL+; supports `merge_strategy: "deep_merge"` or `"stream"`).
3. **`plugin_merge`**: Combines data already fetched by other plugins on the user's account.
4. **`static`**: Uses static JSON configured in `static_data`.
5. **`async_polling`**: Endpoint responds HTTP 202 immediately and POSTs `{"merge_variables": {...}}` to `{{ callback_url }}` within 15 minutes.
6. **`none`**: Markup uses only `trmnl.*` globals or client-side JS.

### Data Transforms (`transform.js` / Serverless)
- Prefer reshaping complex/nested API responses in a transform script before rendering Liquid templates:
  - Default runtime (JS): `function transform(input) { return { ... }; }`
  - Serverless runtime (JS/Python/Ruby/PHP): `function run(input)` / `def run(input)` / `function run($input)`
  - Persistent state across runs: read `input.trmnl.state` and return `trmnl_state: { ... }` (up to 8KB; read in Liquid via `{{ trmnl.state }}`).

### Custom Form Fields (`custom_fields` in `settings.yml`)
- Required keys per field: `keyname`, `field_type`, `name`.
- Fields are **required by default** unless `optional: true` is specified.
- `select` option values are always stored **lowercase**.
- Published Recipes require an `author_bio` field to pass the **Chef** linter.

---

## Testing & Verification Checklist

- [ ] Lint and preview locally using [`trmnlp`](https://github.com/usetrmnl/trmnlp) (`trmnlp lint`, `trmnlp serve`) or test in the TRMNL Markup Editor
- [ ] Verify all 4 view layouts (`full`, `half_horizontal`, `half_vertical`, `quadrant`)
- [ ] Confirm **zero inline `style="..."` attributes** and **zero emojis** in markup
- [ ] Confirm no `<div class="view">` wrapper exists in plugin templates
- [ ] Verify `<div class="layout">` and `<div class="title_bar">` are siblings
- [ ] Verify `.item` elements always include `<div class="meta"></div>`
- [ ] Verify monochrome icons use `image--adaptive` and content photos use `image-dither`
- [ ] Test light mode, dark mode, and Framework 3.4 themes (`Black and Yellow`, `White and Red`, `Dark`)
- [ ] Test across bit depths (`1-bit`, `2-bit`, `4-bit`, and color palettes) and orientations (`landscape`, `portrait`)
- [ ] Verify unconfigured / empty data fallback renders `error_state` cleanly
