FROM mcr.microsoft.com/dotnet/aspnet:8.0.22@sha256:579e1823fc3714a4b07cf7e0ffe4d96aae66a245aa740b138e31446955eadb55
# using the 8.0.17 tag so far
# Install necessary packages
WORKDIR /app

# Copy the application files
COPY ./app .

# Set permissions for the /app folder (read-only)
# Set permissions for the /data (writable)
RUN     chown -R $APP_UID:$APP_UID /data && \
        chmod -R 755 /data

# become non-root user. APP_UID env var is defined by default
# https://devblogs.microsoft.com/dotnet/securing-containers-with-rootless/
USER $APP_UID
ENTRYPOINT ["dotnet", "myapp.dll"]
