FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
ENV ASPNETCORE_ENVIRONMENT=Development

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["KCloud.Web/KCloud.Web.csproj", "KCloud.Web/"]
COPY ["KCloud.Common/KCloud.Common.csproj", "KCloud.Common/"]
RUN dotnet restore "KCloud.Web/KCloud.Web.csproj"
COPY . .
WORKDIR "/src/KCloud.Web"
RUN dotnet publish "KCloud.Web.csproj" -c Release -o /app/out

FROM base AS final
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "KCloud.Web.dll"]