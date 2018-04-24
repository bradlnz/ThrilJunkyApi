FROM microsoft/dotnet

COPY . /

WORKDIR /

RUN ["dotnet", "restore"]

RUN ["dotnet", "build"]

EXPOSE 8080/tcp

ENTRYPOINT ["dotnet", "run", "--server.urls", "http://localhost:8080"]
