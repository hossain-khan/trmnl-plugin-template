---
applyTo: "**"
description: Use when working on anything TRMNL — building plugins, writing or editing
  markup, designing layouts using the TRMNL CSS framework, running local previews/tests
  with trmnlp, calling the TRMNL MCP server (mcp__trmnl__*), or any task that mentions
  "trmnl", "ePaper display", "e-ink display", "trmnl.com", "TRMNL plugin", "Liquid markup",
  "image-dither", "title_bar", or screen sizes 800x480 / 800x240 / 400x480 / 400x240.
  References embed the production prompts TRMNL's external MCP server ships — agent rules,
  the full design system template guide, and the framework v3 supplement.
---

# TRMNL Agent Skill (`usetrmnl/trmnl-agent-skills`)

Auto-generated & integrated from <https://github.com/usetrmnl/trmnl-agent-skills>.

Everything you need to work on TRMNL. The references in this skill are **verbatim copies** of the prompts TRMNL's own production AI assistant reads, bundled in [`.claude/skills/trmnl/`](../../.claude/skills/trmnl/SKILL.md).

## Read first, in this order

| # | Reference | What it covers | Lines |
|---|---|---|---|
| 1 | [`agent_prompt.md`](../../.claude/skills/trmnl/references/agent_prompt.md) | Core rules: data-first hard gate, mandatory workflows, view dimensions, layout system, image dithering, no-custom-styles, no-emojis, common mistakes. **This is also what TRMNL's MCP server ships as the connection-level instructions to every external client.** | 427 |
| 2 | [`template_guide.md`](../../.claude/skills/trmnl/references/template_guide.md) | THE design system reference — every framework class, layout pattern, chart code, item component, custom-fields YAML schema. Bundled here so non-MCP users can read it offline; MCP-connected users can also fetch it via the design-system template-guide tool. | 2881 |
| 3 | [`framework_v3_guide.md`](../../.claude/skills/trmnl/references/framework_v3_guide.md) | v3 supplement: chromatic palette, CSS variables, label variants. v3.0.3+ specific. | 230 |

## Local Autonomous Verification Loop (`bin/trmnlp`)

This repository includes TRMNL's official local preview and testing CLI wrapper ([`bin/trmnlp`](../../bin/trmnlp), backed by [`usetrmnl/trmnlp`](https://github.com/usetrmnl/trmnlp)). After editing any file in `src/` or `.trmnlp.yml`, run:

1. **Static Lint (JSON output for agents)**:
   ```bash
   ./bin/trmnlp lint --format json
   ```
   Validates `src/settings.yml`, custom fields, Liquid syntax, and Framework design rules.
2. **Headless Browser Verification & Overflow Detection**:
   ```bash
   ./bin/trmnlp test --report report
   ```
   Renders all 4 views (`full`, `half_horizontal`, `half_vertical`, `quadrant`) in headless Firefox via Ferrum, checks `have_no_overflow` and `have_no_problems`, and writes PNG screenshots + `results.json` to `report/`.
3. **Static HTML + 1-bit PNG Screenshot Generation**:
   ```bash
   ./bin/trmnlp build --png
   ```
   Outputs rendered HTML (`_build/*.html`) and 800×480 1-bit PNG screenshots (`_build/*.png`) for visual inspection.
