FROM mcr.microsoft.com/dotnet/aspnet:8.0@sha256:47091f7cee02e448630df85542579e09b7bbe3b10bd4e1991ff59d3adbddd720
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
