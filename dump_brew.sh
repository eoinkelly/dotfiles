#!/usr/bin/env bash

set -x
set -e

brew list --formula > brew.list
brew list --cask > brew.cask.list
