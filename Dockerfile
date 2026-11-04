# 1. Use the official Microsoft .NET 10.0 ASP.NET runtime image
FROM ://microsoft.com AS runtime
WORKDIR /app

# 2. Copy the published artifacts from the build stage into the image
COPY ./publish/ .

# 3. Expose port 5000 for the Web API
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000

# 4. Command to run the application
ENTRYPOINT ["dotnet", "MyDotNetApi.dll"]
