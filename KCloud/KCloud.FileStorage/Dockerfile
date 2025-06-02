FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT=Development

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["KCloud.FileStorage/KCloud.FileStorage.csproj", "KCloud.FileStorage/"]
COPY ["KCloud.Common/KCloud.Common.csproj", "KCloud.Common/"]
RUN dotnet restore "KCloud.FileStorage/KCloud.FileStorage.csproj"
COPY . .
WORKDIR "/src/KCloud.FileStorage"
RUN dotnet publish "KCloud.FileStorage.csproj" -c Release -o /app/out

FROM base AS final
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "KCloud.FileStorage.dll"]