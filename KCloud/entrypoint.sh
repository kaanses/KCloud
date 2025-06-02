#!/bin/sh
dotnet-ef database update
dotnet KCloud.FileMetadata.dll
