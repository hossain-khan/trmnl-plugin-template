# Contributing

Thank you for your interest in contributing to this TRMNL plugin template!

## Development Guidelines

### Code Style & TRMNL Framework 3.4 Rules

- **Liquid templates (`src/*.liquid`)**: 2-space indentation
- **YAML configs (`src/settings.yml`, `.trmnlp.yml`, `custom-fields.yml`)**: 2-space indentation; follow the official [TRMNL Form Builder](https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder) and [Import/Export](https://help.trmnl.com/en/articles/10542599-importing-and-exporting-private-plugins) schema (`keyname`, `field_type`, `name`, `optional`)
- **Framework 3.4 first**: Always use [TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4) utilities over custom CSS
- **No inline styles (`style="..."`) or `<style>` blocks**: Use framework classes (`stretch`, `grid`, `col--span-*`, `flex`, `gap--*`)
- **No emojis in markup**: ePaper displays lack emoji fonts and render empty boxes (`□`). Use text labels, semantic badges (`label--success`, `label--warning`, `label--error`), or inline SVGs with `image--adaptive`
- **No `<div class="view">` wrapper**: Start view templates directly with `<div class="layout ...">` and place `<div class="title_bar">` as its sibling

### Template Best Practices

- Always include error states via `{% render "error_state", size: "..." %}`
- Design specifically for each of the 4 view dimensions:
  - [`src/full.liquid`](src/full.liquid) (`800×480` OG / `1040×780` X)
  - [`src/half_horizontal.liquid`](src/half_horizontal.liquid) (`800×240` wide banner — columnize horizontally)
  - [`src/half_vertical.liquid`](src/half_vertical.liquid) (`400×480` narrow column — stack vertically)
  - [`src/quadrant.liquid`](src/quadrant.liquid) (`400×240` postcard — focus on one primary metric)
- Always include `<div class="meta"></div>` inside `.item` components
- Use `image--adaptive` on monochrome icons and `image-dither` on content photos
- Extract reusable partials (`{% template name %}`) and shared variables into [`src/shared.liquid`](src/shared.liquid)

### Testing & Verification

Before opening a pull request, run the local verification suite via [`bin/trmnlp`](bin/trmnlp):

```bash
./bin/trmnlp lint
./bin/trmnlp test --report report
```

All changes must pass:
- `trmnlp lint` with zero issues
- `trmnlp test` (`it_behaves_like 'a publishable recipe'`) across all 4 view sizes (`full`, `half_horizontal`, `half_vertical`, `quadrant`), device models (`og_png`, `og_plus`, `v2`), orientations (`landscape`, `portrait`), dark mode, and API error states

## Questions?

- Review [`GETTING_STARTED.md`](GETTING_STARTED.md) and [`AGENTS.md`](AGENTS.md)
- Check [`README.md`](README.md)
- Look at [`AGENTS.md`](AGENTS.md) and [`.claude/skills/trmnl/SKILL.md`](.claude/skills/trmnl/SKILL.md)
