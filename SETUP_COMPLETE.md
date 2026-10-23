# TRMNL Plugin Template - Setup Complete

This template is configured for **[TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4)**, **[`trmnlp`](https://github.com/usetrmnl/trmnlp)** local development & headless browser testing, **[`trmnl-agent-skills`](https://github.com/usetrmnl/trmnl-agent-skills)**, and the latest [TRMNL Private Plugins](https://help.trmnl.com/en/articles/9510536-private-plugins) specifications.

## What's Included

### Project Structure
```text
trmnl-plugin-template/
├── .claude/
│   ├── settings.json                 ← Auto-enables trmnl@trmnl-agent-skills in Claude Code
│   └── skills/trmnl/                 ← Bundled usetrmnl/trmnl-agent-skills (SKILL.md + references/)
├── .github/
│   ├── instructions/
│   │   └── trmnl.instructions.md     ← GitHub Copilot TRMNL skill instructions
│   └── workflows/
│       └── trmnl.yml                 ← GitHub Actions CI (`trmnlp lint` + `trmnlp test`)
├── .editorconfig                     ← Consistent coding styles
├── .gitignore                        ← Git ignore patterns (ignores _build/ and report/)
├── .trmnlp.yml                       ← Local preview configuration & mock variables
├── assets/
│   └── demo/
│       ├── preview-full.png          ← Rendered 1-bit OG full view screenshot (800×480)
│       ├── preview-half-horizontal.png
│       ├── preview-half-vertical.png
│       ├── preview-quadrant.png
│       └── sample-data.json          ← Test merge variables
├── bin/
│   └── trmnlp                        ← Official CLI wrapper (local gem or trmnl/trmnlp Docker image)
├── src/
│   ├── settings.yml                  ← Official TRMNL plugin settings & custom_fields
│   ├── shared.liquid                 ← Shared variables, inline SVG icon, reusable partials
│   ├── full.liquid                   ← Full-screen layout (800×480 / 1040×780)
│   ├── half_horizontal.liquid        ← Top/bottom banner layout (800×240)
│   ├── half_vertical.liquid          ← Left/right column layout (400×480)
│   ├── quadrant.liquid               ← Quarter-size postcard layout (400×240)
│   ├── transform.js.example          ← Optional JavaScript payload transform template
│   └── transform.py.example          ← Optional Python serverless transform template
├── tests/
│   └── plugin_spec.rb                ← Headless browser RSpec tests (`it_behaves_like 'a publishable recipe'`)
├── AGENTS.md                         ← Autonomous AI agent workflow guide
├── custom-fields.yml                 ← TRMNL Form Builder YAML reference & examples
├── package.json                      ← Project metadata & convenience scripts
├── CONTRIBUTING.md                   ← Contribution guide
├── GETTING_STARTED.md                ← Step-by-step developer guide
├── README.md                         ← Complete documentation
└── LICENSE                           ← MIT License
```

## Key Features

- **Autonomous Local Dev, Linting & Headless Testing (`bin/trmnlp`)**:
  - `./bin/trmnlp serve` — Live preview server at `http://localhost:4567`
  - `./bin/trmnlp lint` / `./bin/trmnlp lint --format json` — Static validation of `src/settings.yml` and `src/*.liquid`
  - `./bin/trmnlp test --report report` — 33 RSpec headless browser checks across TRMNL OG (`800×480` 1-bit) and TRMNL X (`1872×1404` 4-bit), portrait orientation, dark mode, and API error states
  - `./bin/trmnlp build --png` — Static HTML and PNG screenshot builder
- **Bundled `usetrmnl/trmnl-agent-skills`**:
  - Pre-configured for Claude Code (`.claude/settings.json` + `.claude/skills/trmnl/`), GitHub Copilot (`.github/instructions/trmnl.instructions.md`), OpenAI Codex, Gemini CLI, Cursor, OpenCode, and Antigravity (`AGENTS.md`)
- **TRMNL Framework 3.4 Compliant**:
  - Zero inline `style="..."` attributes and zero emojis (ePaper safe)
  - 14-step grayscale (`gray-10`–`gray-75`), chromatic palette, and semantic badges (`label--primary`, `label--success`, `label--warning`, `label--error`)
  - Adaptive monochrome SVG icon (`image--adaptive`) in `.title_bar` that follows dark mode and v3 themes
  - Proper `.item` structure with required `.meta` and `.content` elements

## Version History

- **v1.2.0** (October 2026) — Incorporated `usetrmnl/trmnlp` (`src/` layout, `bin/trmnlp`, `.trmnlp.yml`, `tests/plugin_spec.rb`, `.github/workflows/trmnl.yml`), integrated `usetrmnl/trmnl-agent-skills` (`.claude/skills/trmnl/`, `.claude/settings.json`, `.github/instructions/trmnl.instructions.md`, `AGENTS.md`), and regenerated all 4 demo screenshots
- **v1.1.0** (October 2026) — Migrated to TRMNL Framework 3.4, updated `settings.yml` & `custom-fields.yml` to official TRMNL Form Builder and Private Plugins specifications, added Advanced Liquid patterns
- **v1.0.0** (January 2026) — Initial template release
