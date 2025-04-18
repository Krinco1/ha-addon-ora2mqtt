FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app
COPY run.sh /app/run.sh
COPY bin/Release/net6.0/publish/ /app/

RUN chmod +x /app/run.sh

CMD [ "/app/run.sh" ]