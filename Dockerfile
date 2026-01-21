FROM mcr.microsoft.com/dotnet/aspnet:8.0.23@sha256:4b8f0b08534833b39bb662fb19a65e78cb086f5ca8dd35de3f87026de8885be4
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
