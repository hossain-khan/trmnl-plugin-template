# AI Agent & Copilot Instructions Template - Usage Guide

This repository includes comprehensive instructions and bundled skills from **[`usetrmnl/trmnl-agent-skills`](https://github.com/usetrmnl/trmnl-agent-skills)** and **[`usetrmnl/trmnlp`](https://github.com/usetrmnl/trmnlp)** for AI coding assistants (Claude Code, GitHub Copilot, OpenAI Codex, Gemini CLI, Cursor, OpenCode, Antigravity).

## What is included?

1. **Bundled Production TRMNL Skill ([`.claude/skills/trmnl/`](../.claude/skills/trmnl/SKILL.md))**:
   - [`agent_prompt.md`](../.claude/skills/trmnl/references/agent_prompt.md) — Core rules, data-first hard gate, view dimensions, layout system, image dithering, no-custom-styles, no-emojis
   - [`template_guide.md`](../.claude/skills/trmnl/references/template_guide.md) — Verbatim TRMNL Design System reference (~2,880 lines)
   - [`framework_v3_guide.md`](../.claude/skills/trmnl/references/framework_v3_guide.md) — Framework v3 color palette, `inverse`, `image--adaptive`, `TRMNLPaint`, `TRMNLCharts`, `TRMNLMaps`
2. **Multi-Harness Agent Entry Points**:
   - **Claude Code / OpenCode**: [`.claude/settings.json`](../.claude/settings.json) + [`.claude/skills/trmnl/SKILL.md`](../.claude/skills/trmnl/SKILL.md)
   - **GitHub Copilot**: [`.github/instructions/trmnl.instructions.md`](instructions/trmnl.instructions.md) + [`.github/copilot-instructions.md`](copilot-instructions.md)
   - **Codex / Gemini / Cursor / Generic Agents**: [`AGENTS.md`](../AGENTS.md)
3. **Autonomous Local Verification (`./bin/trmnlp`)**:
   - `./bin/trmnlp lint --format json` — Static validation
   - `./bin/trmnlp test --report report` — Headless browser RSpec verification across all views & devices
   - `./bin/trmnlp build --png` — Static HTML and PNG snapshot generation

## How to customize for your plugin

### Step 1: Customize the header in [`.github/copilot-instructions.md`](copilot-instructions.md)

Replace the placeholder information at the top of the file:

```markdown
> **Repository**: [your-username/your-repo-name] → [yourusername/your-actual-repo]
> **Author**: Your Name → Your Actual Name
> **Framework Version**: [TRMNL Framework 3.4](https://trmnl.com/framework/docs/3.4)
> **Last Updated**: [Current Date]
```

### Step 2: Add project overview & data structure

1. Fill in the **Project Overview** section in [`.github/copilot-instructions.md`](copilot-instructions.md) with your plugin's purpose and goals.
2. Document your actual merge variables (JSON payload from your polling endpoint, webhook, or transform script) and update [`.trmnlp.yml`](../.trmnlp.yml) and [`assets/demo/sample-data.json`](../assets/demo/sample-data.json).
3. Document any custom form fields (`keyname`, `field_type`, `name`) configured in [`src/settings.yml`](../src/settings.yml) and update [`tests/plugin_spec.rb`](../tests/plugin_spec.rb).

## Updating `trmnl-agent-skills`

To pull the latest upstream reference files from [`usetrmnl/trmnl-agent-skills`](https://github.com/usetrmnl/trmnl-agent-skills):

```bash
git clone --depth 1 https://github.com/usetrmnl/trmnl-agent-skills /tmp/trmnl-agent-skills
cp -r /tmp/trmnl-agent-skills/skills/trmnl/* .claude/skills/trmnl/
rm -rf /tmp/trmnl-agent-skills
```

## License

This template is provided under the MIT License — see [LICENSE](../LICENSE) for details.
