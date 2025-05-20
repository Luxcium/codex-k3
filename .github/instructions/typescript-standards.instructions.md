---
applyTo: "**/*.ts,**/*.tsx"
---
# TypeScript Coding Standards

## Style Guidelines

- Follow Airbnb TypeScript style guide for all TypeScript code
- Use 2 spaces for indentation
- Use semicolons at the end of statements
- Use single quotes for strings
- Use PascalCase for class names, interfaces, and type aliases
- Use camelCase for variables, functions, and methods
- Use UPPER_SNAKE_CASE for constants
- Prefix private class members with underscore (_)

## TypeScript Best Practices

- Enable strict type checking with `"strict": true` in tsconfig.json
- Use interfaces for object shapes and public APIs
- Use type aliases for unions, intersections, and utility types
- Avoid using `any` type; use `unknown` when type is uncertain
- Leverage TypeScript's utility types (Partial, Required, Pick, etc.)
- Use discriminated unions for type-safe handling of variant types
- Implement proper error handling with custom error types
- Use async/await for asynchronous operations instead of raw promises

## Code Organization

- Keep files under 300 lines; split into multiple files if longer
- Group related functionality into modules
- Create small, single-purpose functions (≤25 lines)
- Export only what's necessary from modules
- Write unit tests for all business logic
- Use dependency injection for easier testing
- Structure larger applications with feature-based organization

## Documentation

- Add JSDoc comments for public APIs
- Document complex algorithms and business logic
- Include parameter and return type descriptions
- Document side effects and potential exceptions
- Maintain up-to-date documentation for public interfaces
- Include examples for non-trivial usage

## Memory Bank Compliance

- Update dependencies.md for new TypeScript modules or libraries
- Document technical constraints in techContext.md
- Follow patterns documented in systemPatterns.md
- Ensure all setup is performed via scripts in scripts/ directory
- Document all architectural decisions in appropriate memory bank files

## Tooling

- Use ESLint for code quality enforcement
- Configure Prettier for consistent formatting
- Set up Husky for pre-commit hooks
- Implement CI checks for TypeScript type validation

Remember to reference the memory bank files for project-specific guidelines and keep all documentation up-to-date.
