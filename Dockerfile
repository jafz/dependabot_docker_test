FROM mcr.microsoft.com/dotnet/aspnet:8.0.25@sha256:a1a6ed414bde21fce19c1f84e7b4c17d8020d9a82dad55a8adb3775ae5be644d
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
