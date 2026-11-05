FROM ://microsoft.com AS runtime
WORKDIR /app
COPY bin/Release/net10.0/ /app/
EXPOSE 8080
ENTRYPOINT ["dotnet", "MyDotNetApi.dll"]
