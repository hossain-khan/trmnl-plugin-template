# TRMNL Agent Skills & Autonomous Local Workflow

This repository integrates **[`usetrmnl/trmnl-agent-skills`](https://github.com/usetrmnl/trmnl-agent-skills)** and **[`usetrmnl/trmnlp`](https://github.com/usetrmnl/trmnlp)** so AI coding agents (Claude Code, GitHub Copilot, OpenAI Codex, Gemini CLI, Cursor, OpenCode, Antigravity) can build, lint, render, screenshot, and test TRMNL plugins autonomously.

## 1. Read First — Official TRMNL Production References

The bundled references in `.claude/skills/trmnl/references/` are **verbatim copies** of the prompts TRMNL's own production AI assistant and MCP server use:

| # | Reference | What it covers |
|---|---|---|
| 1 | [`.claude/skills/trmnl/SKILL.md`](.claude/skills/trmnl/SKILL.md) | Complete TRMNL skill overview, MCP server setup (`https://trmnl.com/mcp`), and tool name mapping |
| 2 | [`.claude/skills/trmnl/references/agent_prompt.md`](.claude/skills/trmnl/references/agent_prompt.md) | Core rules: data-first hard gate, mandatory workflows, view dimensions (`800×480`, `800×240`, `400×480`, `400×240`), layout system, image dithering, no-custom-styles, no-emojis, common mistakes |
| 3 | [`.claude/skills/trmnl/references/template_guide.md`](.claude/skills/trmnl/references/template_guide.md) | Complete TRMNL Framework 3.4 design system reference — every framework class, layout pattern, chart code, item component, and custom-fields YAML schema |
| 4 | [`.claude/skills/trmnl/references/framework_v3_guide.md`](.claude/skills/trmnl/references/framework_v3_guide.md) | Framework v3 supplement: chromatic palette (`text--red`, `bg--blue`, etc.), CSS variables, label variants, and v3 migration patterns |

## 2. Project Layout (`trmnlp` Standard)

```text
trmnl-plugin-template/
├── .trmnlp.yml                   # Local dev config, mock custom_fields & sample merge variables
├── bin/trmnlp                    # CLI wrapper (runs local `trmnlp` gem or `trmnl/trmnlp` Docker image)
├── src/
│   ├── settings.yml              # Plugin configuration, polling/webhook settings & custom_fields
│   ├── shared.liquid             # Shared Liquid variables, macros, and reusable templates
│   ├── full.liquid               # Full screen view (800×480)
│   ├── half_horizontal.liquid    # Half horizontal view (800×240)
│   ├── half_vertical.liquid      # Half vertical view (400×480)
│   ├── quadrant.liquid           # Quadrant view (400×240)
│   ├── transform.js.example      # Optional JS payload transform template
│   └── transform.py.example      # Optional Python payload transform template
├── tests/
│   └── plugin_spec.rb            # RSpec headless browser tests (overflow, recipe validation, assertions)
└── assets/
    └── demo/                     # Sample JSON payload and rendered preview screenshots
```

## 3. Autonomous Agent Verification Workflow (`./bin/trmnlp`)

Whenever you create or modify files in `src/` or `.trmnlp.yml`, **always** run the local verification loop before finishing:

### Step 1: Static Linter (`trmnlp lint`)
```bash
./bin/trmnlp lint --format json
```
Checks `src/settings.yml` schema, custom field types, Liquid syntax, and TRMNL Framework rules. Fix all errors and warnings before proceeding.

### Step 2: Headless Browser & Overflow Tests (`trmnlp test`)
```bash
./bin/trmnlp test --report report
```
Renders all 4 layouts (`full`, `half_horizontal`, `half_vertical`, `quadrant`) in a real headless browser, runs `tests/plugin_spec.rb` (`it_behaves_like 'a publishable recipe'`, `have_no_overflow`, `have_no_problems`), and outputs screenshots + `report/results.json`.

### Step 3: Build Screenshots & Visually Inspect (`trmnlp build --png`)
```bash
./bin/trmnlp build --png
```
Generates `_build/full.png`, `_build/half_horizontal.png`, `_build/half_vertical.png`, and `_build/quadrant.png` ( plus `.html` files). Open and inspect the PNG screenshots using your vision/file-reading tool to verify:
- Zero text clipping or overflow across all 4 view sizes
- Proper visual hierarchy and whitespace balance
- No missing images or broken icons (remember: **no emojis** and **no inline `style="..."` attributes**)

## 4. Non-Negotiable TRMNL Framework 3.4 Rules

1. **NO Custom CSS or Inline Styles**: Never use `<style>` blocks or inline `style="..."` attributes (only exception: `style="width: X%"` inside `.progress-bar` fill elements).
2. **NO Emojis**: Emojis render as blank tofu boxes on e-ink hardware. Use text labels, badges, or monochromatic SVGs with `image-dither`.
3. **NO `<div class="view">` Wrapper in View Templates**: TRMNL's host layout provides the `.screen` and `.view` wrapper automatically. Each view template (`src/full.liquid`, etc.) must start directly with `<div class="layout ...">`, followed by `<div class="title_bar">` as a sibling.
4. **Data-First & Graceful Empty States**: Always guard against missing/empty data and display a clean fallback card when unconfigured.
