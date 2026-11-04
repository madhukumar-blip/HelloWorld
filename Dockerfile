# Use the official Microsoft ASP.NET Core production runtime image
FROM ://microsoft.com AS runtime
WORKDIR /app

# Copy the compiled binaries directly from the compilation workspace
COPY bin/Release/net10.0/ /app/

# Expose the standard internal API container port
EXPOSE 8080

# Execute the application DLL on container startup
ENTRYPOINT ["dotnet", "MyDotNetApi.dll"]
