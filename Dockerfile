FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /app
COPY . /app

RUN chmod +x /app/run.sh

CMD [ "/app/run.sh" ]