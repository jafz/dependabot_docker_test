FROM dhi.io/aspnetcore::10.0.3@sha256:4d0523a6fb7172446fda7c4f9e7506b0d1d3f5f9c7e5400d36a18fdc972dfeb3
# using the 8.0.17 tag so far
# Install necessary packages
WORKDIR /app

# Copy the application files
COPY ./app .

# become non-root user. APP_UID env var is defined by default
# https://devblogs.microsoft.com/dotnet/securing-containers-with-rootless/
USER $APP_UID
ENTRYPOINT ["dotnet", "myapp.dll"]
