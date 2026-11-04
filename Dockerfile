# Use the official production container path from Microsoft Artifact Registry
FROM ://microsoft.com AS runtime
WORKDIR /app

# Copy the compiled binaries that your Build step just compiled
COPY bin/Release/net10.0/ /app/

EXPOSE 8080
ENTRYPOINT ["dotnet", "MyDotNetApi.dll"]
