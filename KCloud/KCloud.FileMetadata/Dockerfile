# Base image with ASP.NET Core runtime
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT=Development

# Install EF Core CLI for migrations
RUN dotnet tool install -g dotnet-ef --version 8.0.0
ENV PATH="$PATH:/root/.dotnet/tools"

# Build image (compile app)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
# Copy project files
COPY ["KCloud.FileMetadata/KCloud.FileMetadata.csproj", "KCloud.FileMetadata/"]
COPY ["KCloud.Common/KCloud.Common.csproj", "KCloud.Common/"]
RUN dotnet restore "KCloud.FileMetadata/KCloud.FileMetadata.csproj"
# Copy all source files
COPY . .
WORKDIR "/src/KCloud.FileMetadata"
RUN dotnet publish "KCloud.FileMetadata.csproj" -c Release -o /app/out

# Final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/out .
# Entrypoint script to run migrations then start app
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]