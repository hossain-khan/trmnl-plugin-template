# Getting Started with This Template

This guide walks you through setting up your TRMNL plugin using this template.

## Step 1: Clone the Repository

This template is already in place. You can now customize it for your specific plugin.

## Step 2: Customize Configuration Files

### Update `settings.yml`

1. Change the `polling_url` to your backend API endpoint:
   ```yaml
   polling_url: "https://your-api.example.com/plugin/data"
   ```

2. Adjust `refresh_frequency` based on your data update frequency:
   - Fast data: 5-15 minutes
   - Medium: 15-30 minutes
   - Slow changing: 30-60+ minutes

3. Update the `name` and `description`:
   ```yaml
   name: "My Cool Plugin"
   description: "Displays important information from my service"
   ```

4. Keep or remove layout types based on what you want to support:
   ```yaml
   layouts:
     - full                    # Always keep full
     - half_horizontal         # Optional
     - half_vertical           # Optional
     - quadrant                # Optional
   ```

### Update `custom-fields.yml`

1. Remove example fields you don't need
2. Add your required fields (API keys, preferences, etc.)
3. Use appropriate field types for validation

Example:
```yaml
- key: "api_key"
  type: "text"
  label: "OpenWeather API Key"
  required: true
  description: "Get from openweathermap.org"

- key: "city"
  type: "text"
  label: "City Name"
  required: true
  placeholder: "New York"
```

## Step 3: Edit Template Files

### 1. Start with `shared.liquid`

Update or add reusable components:

```liquid
{% template my_custom_component %}
<div class="flex flex--col gap--small">
  <span class="value value--large">{{ value }}</span>
  <span class="label">{{ label }}</span>
</div>
{% endtemplate %}
```

### 2. Update `full.liquid`

Replace the example content with your actual plugin display:

```liquid
<div class="layout">
  {% if has_data %}
    <!-- Your main content here -->
    <div class="flex flex--center-x flex--center-y h--full">
      <div class="text--center">
        <div class="value value--large md:value--xlarge">
          {{ your_data }}
        </div>
        <div class="title title--medium">
          {{ your_title }}
        </div>
      </div>
    </div>
  {% else %}
    {% render "shared", template_name: "error_state", size: "full" %}
  {% endif %}
</div>

<div class="title_bar">
  <span class="title md:title--large">{{ plugin_name }}</span>
</div>
```

### 3. Update Other Layouts

- `half_horizontal.liquid` - Side-by-side content
- `half_vertical.liquid` - Stacked content
- `quadrant.liquid` - Minimal compact display

## Step 4: Test in TRMNL Markup Editor

1. Go to [editor.usetrmnl.com](https://editor.usetrmnl.com)
2. Copy your template code into the editor
3. Add your sample JSON data:
   ```json
   {
     "has_data": true,
     "your_data": "42",
     "your_title": "Example"
   }
   ```
4. Preview on different device sizes
5. Verify responsive behavior

## Step 5: Set Up Your Backend

Create an API endpoint that returns JSON:

### Example with Node.js/Express:

```javascript
app.get('/plugin/data', (req, res) => {
  const data = {
    has_data: true,
    your_data: "42",
    your_title: "Example Value",
    status: "success"
  };
  res.json(data);
});
```

### Example with Python/Flask:

```python
@app.route('/plugin/data')
def get_plugin_data():
    return {
        'has_data': True,
        'your_data': '42',
        'your_title': 'Example Value',
        'status': 'success'
    }
```

**Important**: 
- ✅ Return valid JSON
- ✅ Use HTTPS only
- ✅ Respond in <3 seconds
- ✅ Include error handling

## Step 6: Update Documentation

Update `.github/copilot-instructions.md`:

1. Replace the placeholder header:
   ```markdown
   > **Repository**: [your-username/your-repo]
   > **Author**: Your Name
   > **Last Updated**: January 2026
   ```

2. Fill in your project overview section

3. Document your data structure

4. Add any project-specific patterns

See [TEMPLATE_USAGE.md](TEMPLATE_USAGE.md) for detailed customization instructions.

## Step 7: Test Everything

### Manual Testing Checklist

- [ ] Layouts render correctly in markup editor
- [ ] Responsive behavior works (test sm, md, lg)
- [ ] Error state displays when `has_data: false`
- [ ] Text truncation works with long content
- [ ] Images display correctly
- [ ] Portrait mode rendering works
- [ ] Backend API returns valid data
- [ ] Data updates at correct frequency

### Edge Cases to Test

- Empty/minimal data
- Very long text (100+ characters)
- Special characters and unicode
- Null/undefined values
- Missing optional fields
- API timeout/error responses

## Step 8: Ready to Deploy!

When everything is tested:

1. Push your code to GitHub
2. Create a plugin recipe in TRMNL Dashboard
3. Upload your templates and assets
4. Submit for review
5. Deploy your backend API

## Useful Variables

### TRMNL Platform Variables

```liquid
<!-- User info -->
{{ trmnl.user.first_name }}
{{ trmnl.user.timezone }}

<!-- Plugin settings -->
{{ trmnl.plugin_settings.instance_name }}
{{ trmnl.plugin_settings.custom_fields_values.field_key }}

<!-- Device info -->
{{ trmnl.device.model }}
{{ trmnl.device.orientation }}
```

### Data Filters

```liquid
<!-- Formatting -->
{{ text | truncate: 50 }}
{{ number | number_with_delimiter }}
{{ date | date: "%B %d, %Y" }}
{{ date | relative_time }}

<!-- Default values -->
{{ missing_field | default: "N/A" }}
```

## Framework Classes Reference

### Layout
```liquid
<!-- Flexbox -->
<div class="flex flex--row flex--center-x flex--center-y gap--medium h--full">

<!-- Grid -->
<div class="grid grid--cols-2 gap--small">

<!-- Spacing -->
<div class="p--2 mb--small">
```

### Typography
```liquid
<span class="value value--large md:value--xlarge">42</span>
<span class="title title--medium md:title--large">Heading</span>
<span class="label">Label</span>
<span class="description">Description text</span>
```

### Visual
```liquid
<div class="bg--white rounded outline text--center">
<img class="image image--contain image-dither">
```

### Responsive
```liquid
<!-- Size breakpoints -->
sm: (600px+)
md: (800px+)
lg: (1024px+)

<!-- Orientation -->
portrait:

<!-- Bit-depth -->
1bit: 2bit: 4bit: 8bit:
```

## Troubleshooting

**Templates not rendering?**
- Check for syntax errors (unmatched tags, quotes)
- Verify JSON data structure matches template variables
- Test in markup editor first before publishing

**Layout breaks on some devices?**
- Test on all device sizes in markup editor
- Use responsive classes: `sm:`, `md:`, `lg:`
- Avoid fixed widths - use `flex: 1` or percentages

**Data not displaying?**
- Verify backend API returns valid JSON
- Check custom field names match template variables
- Add error states to handle missing data

**Text overflowing?**
- Use `data-clamp="2"` to limit lines
- Set `max-width` on containers
- Use `truncate` filter for single lines

## Need Help?

- Check [TRMNL Framework Docs](https://usetrmnl.com/framework)
- Read [Plugin Guides](https://help.usetrmnl.com/en/collections/7820559-plugin-guides)
- Review [Liquid Documentation](https://shopify.github.io/liquid/)
- Check `.github/copilot-instructions.md` for project-specific guidance

---

**Good luck building your TRMNL plugin! 🎉**
