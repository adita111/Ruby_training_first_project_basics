# Ruby Training — First Project (RubyGem CLI)

A beginner-friendly Ruby training project that implements a small command-line tool packaged as a RubyGem. This repository demonstrates how to structure a gem, build and run a CLI, add tests, and prepare a package for publishing to RubyGems.org.

## Overview
This project is an introduction to creating Ruby libraries and command-line interfaces. It's intended for learners who want hands-on experience with:
- Gem structure and the gemspec file
- CLI development (OptionParser, Thor, or similar)
- Automated tasks with Rake
- Writing tests (RSpec or Minitest)
- Building and publishing a gem

## Features
- Simple CLI with a few example commands (e.g., greet, init, version)
- Gem scaffolding and a working gemspec
- Rake tasks for build/test/release
- Example test suite and CI-ready layout
- Clear README with installation and usage instructions

## Installation
Install from RubyGems (when published):
gem install your_gem_name

Or build and install locally:
bundle install
rake build
gem install pkg/your_gem_name-0.1.0.gem

## Usage
Run the CLI (replace `your_gem` with the actual executable name):
your_gem --help
your_gem greet --name "Alice"

## Development
- Run tests:
  - bundle exec rspec
  - or rake test
- Build the gem:
  - rake build
- Release to RubyGems:
  - rake release
  (Make sure to update the version and push tags before releasing.)

## Goals / Learning Outcomes
By working through this project you will learn:
- How to structure and version a RubyGem
- How to expose a command-line interface
- How to add automation (Rake) for build/test/release
- How to write and run unit tests for Ruby code
- The steps to publish a gem to RubyGems.org

