# TRMNL Plugin Template - Setup Complete

This template is configured for **[TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4)** and the latest [TRMNL Private Plugins](https://help.trmnl.com/en/articles/9510536-private-plugins) specifications.

## What's Included

### Project Structure
```
trmnl-plugin-template/
├── .github/
│   ├── copilot-instructions.md    ← AI context (Framework 3.4, Advanced Liquid, Form Builder)
│   └── TEMPLATE_USAGE.md          ← How to customize this template
├── .editorconfig                  ← Consistent coding styles
├── .gitignore                     ← Git ignore patterns
├── assets/
│   └── demo/
│       └── sample-data.json       ← Test merge variables
├── templates/
│   ├── shared.liquid              ← Shared variables, inline SVG icon, reusable partials
│   ├── full.liquid                ← Full-screen layout (800×480 / 1040×780)
│   ├── half_horizontal.liquid     ← Top/bottom banner layout (800×240)
│   ├── half_vertical.liquid       ← Left/right column layout (400×480)
│   └── quadrant.liquid            ← Quarter-size postcard layout (400×240)
├── custom-fields.yml              ← TRMNL Form Builder YAML reference & examples
├── settings.yml                   ← Official TRMNL plugin settings & custom_fields
├── package.json                   ← Project metadata
├── CONTRIBUTING.md                ← Contribution guide
├── GETTING_STARTED.md             ← Step-by-step developer guide
├── README.md                      ← Complete documentation
└── LICENSE                        ← MIT License
```

## Key Features

- **TRMNL Framework 3.4 Compliant**:
  - Zero inline `style="..."` attributes and zero emojis (ePaper safe)
  - 14-step grayscale (`gray-10`–`gray-75`), chromatic palette, and semantic badges (`label--primary`, `label--success`, `label--warning`, `label--error`)
  - Adaptive monochrome SVG icon (`image--adaptive`) in `.title_bar` that follows dark mode and v3 themes
  - Proper `.item` structure with required `.meta` and `.content` elements
- **Official `settings.yml` & `custom_fields` Schema**:
  - Supports all 6 TRMNL strategies (`polling`, `webhook`, `plugin_merge`, `static`, `async_polling`, `none`)
  - Valid Form Builder YAML (`keyname`, `field_type`, `name`, `optional`, `conditional_validation`, `author_bio`)
- **Advanced Liquid Patterns**:
  - Timezone conversion via `trmnl.user.utc_offset` and `trmnl.user.time_zone_iana`
  - Localization via `l_word` and `l_date` (`trmnl.user.locale`)
  - Custom filters (`random_number`, `append_random`, `json`, `parse_json`, `qr_code`)

## Framework & Documentation Links

- [TRMNL Framework 3.4 Docs](https://trmnl.com/framework/docs/3.4)
- [Private Plugins Guide](https://help.trmnl.com/en/articles/9510536-private-plugins)
- [Plugin Strategies](https://help.trmnl.com/en/articles/17434705-plugin-strategies)
- [Custom Plugin Form Builder](https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder)
- [Advanced Liquid Guide](https://help.trmnl.com/en/articles/10693981-advanced-liquid)
- [Custom Plugin Filters](https://help.trmnl.com/en/articles/10347358-custom-plugin-filters)
- [Importing & Exporting Private Plugins](https://help.trmnl.com/en/articles/10542599-importing-and-exporting-private-plugins)
- [`trmnlp` Local Preview & Linter](https://github.com/usetrmnl/trmnlp)

## Version History

- **v1.1.0** (October 2026) — Migrated to TRMNL Framework 3.4, updated `settings.yml` & `custom-fields.yml` to official TRMNL Form Builder and Private Plugins specifications, added Advanced Liquid patterns
- **v1.0.0** (January 2026) — Initial template release
