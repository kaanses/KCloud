# Contributing Guidelines

## Git Workflow

We follow a simplified Git Flow workflow:

### Branch Naming Convention

- `feature/feature-name`: For new features
- `bugfix/bug-description`: For bug fixes
- `hotfix/issue-description`: For critical fixes
- `release/version-number`: For release preparations

### Development Process

1. Create a feature branch from `develop`

2. Make changes and commit regularly with meaningful messages
  
3. 3. Push your feature branch to GitHub

4. Create a Pull Request to merge into `develop`

5. After code review and approval, merge the PR

6. For releases, create a release branch from `develop`, test thoroughly, then merge to `main`

### Commit Message Guidelines

Format: `[Component] Brief description of change`

Examples:
- `[Auth] Add JWT token generation service`
- `[FileMetadata] Fix file listing pagination issue`
- `[WebApp] Improve file upload UI experience`

### Pull Request Process

1. Update the README.md with details of changes if applicable
2. Update documentation if required
3. The PR requires at least one approval before merging
4. Merge only after all CI checks pass

     
