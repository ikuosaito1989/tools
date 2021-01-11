#!/bin/sh

# dotnetのセットアップするスクリプト

set -e;

dotnet restore
dotnet build
dotnet tool restore