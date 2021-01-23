#!/bin/sh

# dotnetのセットアップするスクリプト

set -e;

dotnet restore
dotnet build --no-incremental
dotnet tool restore