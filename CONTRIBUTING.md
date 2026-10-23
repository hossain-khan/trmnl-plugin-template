# Contributing

Thank you for your interest in contributing to this TRMNL plugin template!

## Development Guidelines

### Code Style & TRMNL Framework 3.4 Rules

- **Liquid templates**: 2-space indentation
- **YAML configs**: 2-space indentation; follow the official [TRMNL Form Builder](https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder) and [Import/Export](https://help.trmnl.com/en/articles/10542599-importing-and-exporting-private-plugins) schema (`keyname`, `field_type`, `name`, `optional`)
- **Framework 3.4 first**: Always use [TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4) utilities over custom CSS
- **No inline styles (`style="..."`) or `<style>` blocks**: Use framework classes (`stretch`, `grid`, `col--span-*`, `flex`, `gap--*`)
- **No emojis in markup**: ePaper displays lack emoji fonts and render empty boxes (`□`). Use text labels, semantic badges (`label--success`, `label--warning`, `label--error`), or inline SVGs with `image--adaptive`
- **No `<div class="view">` wrapper**: Start view templates directly with `<div class="layout ...">` and place `<div class="title_bar">` as its sibling

### Template Best Practices

- Always include error states via `{% render "error_state", size: "..." %}`
- Design specifically for each of the 4 view dimensions:
  - `full.liquid` (`800×480` / `1040×780`)
  - `half_horizontal.liquid` (`800×240` wide banner — columnize horizontally)
  - `half_vertical.liquid` (`400×480` narrow column — stack vertically)
  - `quadrant.liquid` (`400×240` postcard — focus on one primary metric)
- Always include `<div class="meta"></div>` inside `.item` components
- Use `image--adaptive` on monochrome icons and `image-dither` on content photos
- Extract reusable partials (`{% template name %}`) and shared variables into `templates/shared.liquid`

### Testing

All changes should be verified:

- With [`trmnlp lint` and `trmnlp serve`](https://github.com/usetrmnl/trmnlp) or in the TRMNL Markup Editor
- Across all 4 view sizes (`full`, `half_horizontal`, `half_vertical`, `quadrant`)
- With sample data ([`assets/demo/sample-data.json`](assets/demo/sample-data.json)) and unconfigured/empty states
- Across bit-depths (`1-bit`, `2-bit`, `4-bit`, and color ePaper palettes), orientations (`landscape`, `portrait`), dark mode, and Framework 3.4 themes

## Questions?

- Review [`GETTING_STARTED.md`](GETTING_STARTED.md)
- Check [`README.md`](README.md)
- Look at [`.github/copilot-instructions.md`](.github/copilot-instructions.md)
