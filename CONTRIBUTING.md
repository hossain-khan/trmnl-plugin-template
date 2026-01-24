# Contributing

Thank you for your interest in contributing to this TRMNL plugin template!

## How to Contribute

### Reporting Issues

Found a bug or have a suggestion? Please open an issue with:

- **Title**: Clear, descriptive title
- **Description**: What's the problem?
- **Steps to reproduce**: How to see the issue (if applicable)
- **Expected behavior**: What should happen
- **Screenshots**: If visually relevant

### Suggesting Improvements

Have an idea to make the template better?

1. Check existing issues/PRs to avoid duplicates
2. Describe your improvement clearly
3. Explain why it would benefit developers
4. Provide examples if possible

### Submitting Changes

1. **Fork the repository**
   ```bash
   git clone https://github.com/your-username/trmnl-plugin-template.git
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Update template files as needed
   - Update documentation to reflect changes
   - Keep code clean and consistent

4. **Test your changes**
   - Test in TRMNL Markup Editor
   - Verify all layouts still work
   - Check responsive behavior

5. **Commit your changes**
   ```bash
   git commit -m "Describe your changes clearly"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Open a Pull Request**
   - Clear title and description
   - Reference any related issues
   - Include screenshots for visual changes

## Development Guidelines

### Code Style

- **Liquid templates**: 2-space indentation
- **YAML configs**: 2-space indentation
- **Comments**: Explain the "why", not just the "what"
- **Framework first**: Always use TRMNL utilities over custom CSS

### Template Best Practices

- Always include error states
- Test all 4 layouts (full, half_horizontal, half_vertical, quadrant)
- Use responsive classes: `sm:`, `md:`, `lg:`
- Extract reusable components to `shared.liquid`
- Document complex logic with comments
- Check for accessibility (alt text, semantic HTML)

### Documentation

When adding features:
- Update `README.md` if user-facing
- Update `.github/copilot-instructions.md` if pattern-based
- Add examples for new components
- Keep documentation clear and concise

### Testing

All changes should be tested:

- ✅ In TRMNL Markup Editor across all device sizes
- ✅ With sample data and edge cases
- ✅ Error states and fallbacks
- ✅ Responsive behavior (landscape/portrait)
- ✅ Different bit-depths (1-bit, 2-bit, 4-bit, 8-bit)

## What We're Looking For

### High Priority

- Bug fixes and critical issues
- Documentation improvements
- New reusable components
- Better error handling patterns
- Performance optimizations
- Accessibility improvements

### Welcome Contributions

- Additional example templates
- Better comments/explanations
- More comprehensive error patterns
- Testing guides
- Deployment examples
- Integration examples

### Less Priority

- Cosmetic changes
- Opinionated style changes (unless improving consistency)
- Features that complicate the template
- Major API changes

## Questions?

- Review [GETTING_STARTED.md](GETTING_STARTED.md)
- Check [README.md](README.md)
- Look at [.github/copilot-instructions.md](.github/copilot-instructions.md)
- Search existing issues/discussions

## Code of Conduct

Be respectful and constructive. This is a community for developers helping developers.

---

**Thank you for making this template better! 🙏**
