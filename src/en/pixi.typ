#import "../templates/conf.typ": *

#show: template.with(
  title: "pixi Cheatsheet",
  header: [#datetime.today().display()],
  footer: "https://pixi.sh/latest/",
)

= Overview

`pixi` is a modern, cross-platform package manager and workflow tool built on the Conda ecosystem. Written in Rust, it offers conda's powerful binary package management with cargo/npm-level developer experience — fast, reproducible, and project-centric.

= Project Initialization

- `pixi init`: Initialize a new project in the current directory (creates `pixi.toml`).
  - `--conda-channels <ch1>,<ch2>`: Specify Conda channels (e.g., `conda-forge`).
  - `--platform <p1>,<p2>`: Specify target platforms (e.g., `win-64`, `linux-aarch64`).
- `pixi init --import environment.yml`: Import an existing Conda environment file.

= Dependency Management

- `pixi add <package>`: Add a new package to the project.
  - `pixi add "numpy>=1.20,<2.0"`: Add with version constraints.
  - `pixi add --pypi <package>`: Add a package from PyPI directly.
  - `pixi add --platform <platform> <package>`: Add a platform-specific dependency.
  - `pixi add --build <package>`: Add a build-time-only dependency.
  - `pixi add --host <package>`: Add a host (runtime) dependency.
- `pixi remove <package>`: Remove a dependency from the project.
- `pixi list`: List all installed dependencies.
  - `--platform <platform>`: Show dependencies for a specific platform.
- `pixi install`: Install all dependencies defined in `pixi.toml` and generate/update `pixi.lock`.
- `pixi update`: Update packages to the latest versions allowed by `pixi.toml` constraints, and refresh the lock file.
- `pixi search <package>`: Search for available packages in Conda channels.

= Running Tasks & Environments

- `pixi run <task> [args...]`: Execute a task defined in `[tasks]` of `pixi.toml`.
- `pixi shell`: Start a shell with the project environment activated.
- `pixi shell --env <env>`: Activate a specific named environment.
- `pixi run -e <env> <command>`: Run a command in a specific environment.
- `pixi task list`: List all available tasks.
- `pixi task add <name> <cmd>`: Add a new task to `pixi.toml`.
  - Example: `pixi task add test "pytest -v"`
- `pixi task remove <name>`: Remove a registered task.

= Multi-Environment Support (Features)

`pixi` uses *features* to manage multiple environments (e.g., `test`, `docs`, `gpu`) within one project. Each feature adds extra dependencies on top of the base environment.

```toml
[feature.test.dependencies]
pytest = "*"
pytest-cov = "*"

[feature.docs.dependencies]
mkdocs = "*"
mkdocs-material = "*"

[environments]
test = ["test"]        # env named "test" uses feature "test"
docs = ["docs"]
```
- Run in feature env: `pixi run --env test pytest`
- Predefined task per env:
  ```toml
  [tasks]
  test = { cmd = "pytest", env = "test" }
  ```
  Then just: `pixi run test`

= pixi.toml Configuration

```toml
[project]
name = "my-project"
version = "0.1.0"
description = "Example pixi project"
authors = ["Jane Smith <jane@example.com>"]
channels = ["conda-forge"]         # Conda channels
platforms = ["linux-64", "osx-arm64", "win-64"]

[tasks]
start  = "python main.py"
lint   = "ruff check ."
format = { cmd = "ruff format .", description = "Format code" }
test   = { cmd = "pytest", env = "test" }

[dependencies]
python  = ">=3.9"
numpy   = ">=1.20"
pandas  = "*"

[build-dependencies]
cmake = "*"

[feature.test.dependencies]
pytest     = "*"
pytest-cov = "*"

[feature.docs.dependencies]
mkdocs          = "*"
mkdocs-material = "*"

[environments]
test = ["test"]
docs = ["docs"]
```

= Global Tools

- `pixi global install <package>`: Install a tool globally for use outside projects (replaces `pipx` / `conda install -g`).
- `pixi global list`: List globally installed tools.
- `pixi global remove <package>`: Remove a globally installed tool.
- `pixi global update <package>`: Update a globally installed tool.

= Utilities

- `pixi info`: Show current project and system environment details.
- `pixi self-update`: Update the pixi binary itself to the latest version.
- `pixi auth login`: Authenticate for access to private Conda channels.
- `pixi project channels add <channel>`: Add a new Conda channel to the project.
- `pixi project platforms add <platform>`: Add a new supported platform.
- `pixi clean`: Remove the `.pixi` environment cache for the project.

= Why pixi?

- *Perfect reproducibility*: `pixi.lock` guarantees identical environments on every machine and CI run.
- *Blazing speed*: Parallel downloads and an efficient Rust resolver — much faster than `conda` or even `mamba`.
- *Unified workflow*: Dependency management + task runner + environment control in one tool.
- *No Conda required*: Standalone binary — works without any prior Conda/Mamba installation.
- *True cross-platform*: Windows, macOS, and Linux all use the same `pixi.toml`.
- *Zero-config CI*: `pixi run test` is all you need in any CI pipeline.
