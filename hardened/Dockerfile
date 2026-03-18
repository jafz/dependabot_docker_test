FROM dhi.io/aspnetcore:10.0.3@sha256:4d0523a6fb7172446fda7c4f9e7506b0d1d3f5f9c7e5400d36a18fdc972dfeb3 as build

FROM dhi.io/aspnetcore:8.0.25@sha256:ab74ffb6edadf1ee9a982aff8f16dfa939034c9a468081ba011591ac7224373b
# using the 8.0.17 tag so far
# Install necessary packages
WORKDIR /app

# Copy the application files
COPY ./app .

# become non-root user. APP_UID env var is defined by default
# https://devblogs.microsoft.com/dotnet/securing-containers-with-rootless/
USER $APP_UID
ENTRYPOINT ["dotnet", "myapp.dll"]
