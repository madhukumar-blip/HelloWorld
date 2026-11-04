# Use the official Microsoft ASP.NET Core runtime base image
FROM ://microsoft.com AS runtime
WORKDIR /app

# Copy the compiled binaries that Jenkins just built
COPY bin/Release/net10.0/ /app/

# Expose port 8080 for the API application
EXPOSE 8080

# Define the execution entrypoint
ENTRYPOINT ["dotnet", "MyDotNetApi.dll"]
