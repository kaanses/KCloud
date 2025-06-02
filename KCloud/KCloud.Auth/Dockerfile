FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT=Development

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["KCloud.Auth/KCloud.Auth.csproj", "KCloud.Auth/"]
COPY ["KCloud.Common/KCloud.Common.csproj", "KCloud.Common/"]
RUN dotnet restore "KCloud.Auth/KCloud.Auth.csproj"
COPY . .
WORKDIR "/src/KCloud.Auth"
RUN dotnet publish "KCloud.Auth.csproj" -c Release -o /app/out

FROM base AS final
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "KCloud.Auth.dll"]