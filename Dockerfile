FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app

COPY run.sh ./run.sh
COPY bin/Release/net6.0/publish/ ./

RUN chmod +x run.sh

CMD ["./run.sh"]