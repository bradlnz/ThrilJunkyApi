FROM microsoft/dotnet

COPY . /app

WORKDIR /app

RUN ["dotnet", "restore"]

RUN ["dotnet", "build"]

EXPOSE 8080/tcp

ENTRYPOINT ["dotnet", "run", "--server.urls", "http://localhost:5000"]
