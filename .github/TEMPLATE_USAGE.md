# Generic Copilot Instructions Template - Usage Guide

This repository contains a **generic [`.github/copilot-instructions.md`](copilot-instructions.md) template** that can be used as a starting point for any TRMNL plugin project.

## What is this template?

The [`.github/copilot-instructions.md`](copilot-instructions.md) file is a comprehensive guide for AI assistants (GitHub Copilot, Claude Code, Cursor, Gemini, etc.) working on TRMNL plugin projects. It provides:

- Complete **[TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4)** documentation (14-step grayscale, chromatic & semantic colors, themes, `image--adaptive`, `inverse`, `TRMNLPaint`, `TRMNLCharts`, `TRMNLMaps`, position utilities, shade-step borders)
- Hard ePaper rules (no inline `style="..."` or `<style>` blocks, no emojis, no `<div class="view">` wrapper, mandatory `image-dither` on photos)
- View dimensions and spatial adaptation strategies (`full` 800×480, `half_horizontal` 800×240, `half_vertical` 400×480, `quadrant` 400×240)
- Official [Private Plugins](https://help.trmnl.com/en/articles/9510536-private-plugins) strategies (`polling`, `webhook`, `plugin_merge`, `static`, `async_polling`, `none`), Transforms (`transform.js` / Serverless), and [Custom Form Builder](https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder) YAML schema
- [Advanced Liquid](https://help.trmnl.com/en/articles/10693981-advanced-liquid) & [Custom Plugin Filters](https://help.trmnl.com/en/articles/10347358-custom-plugin-filters) patterns

## How to use this template

### Step 1: Copy or clone the template

Copy [`.github/copilot-instructions.md`](copilot-instructions.md) to your new TRMNL plugin project:

```bash
cp .github/copilot-instructions.md /path/to/your/plugin/.github/copilot-instructions.md
```

### Step 2: Customize the header

Replace the placeholder information at the top of the file:

```markdown
> **Repository**: [your-username/your-repo-name] → [yourusername/your-actual-repo]
> **Author**: Your Name → Your Actual Name
> **Framework Version**: [TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4)
> **Last Updated**: [Current Date]
```

### Step 3: Add project overview & data structure

1. Fill in the **Project Overview** section with your plugin's purpose and goals.
2. Document your actual merge variables (JSON payload from your polling endpoint, webhook, or transform script).
3. Document any custom form fields (`keyname`, `field_type`, `name`) configured in `settings.yml`.

## What should you keep?

**Always keep these core sections:**

1. **Hard Rules for TRMNL ePaper Markup** — Prevents inline CSS, emojis, and `<div class="view">` wrapper bugs
2. **TRMNL Framework 3.4** — Device specs, view dimensions, color & grayscale tokens, and core utilities
3. **Advanced Liquid & Custom TRMNL Filters** — Timezone conversion (`utc_offset`), localization (`l_word`, `l_date`), and JS integration
4. **Private Plugins & Data Strategies** — Polling, Webhook, Plugin Merge, Transforms, and Form Builder rules
5. **Testing & Verification Checklist** — Pre-flight checks before publishing

## Getting Help

- [TRMNL Framework 3.4 Docs](https://trmnl.com/framework/docs/3.4)
- [Private Plugins Guide](https://help.trmnl.com/en/articles/9510536-private-plugins)
- [Advanced Liquid Guide](https://help.trmnl.com/en/articles/10693981-advanced-liquid)
- [Custom Plugin Form Builder](https://help.trmnl.com/en/articles/10513740-custom-plugin-form-builder)
- [TRMNL Agent Skills](https://github.com/usetrmnl/trmnl-agent-skills)

## License

This template is provided under the MIT License — see [LICENSE](../LICENSE) for details.
