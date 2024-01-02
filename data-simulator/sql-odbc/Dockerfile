FROM mcr.microsoft.com/mssql/server:2019-latest 
COPY ./common /scripts/common
COPY ./manufacturing /scripts/manufacturing
COPY ./entrypoint.sh /entrypoint.sh
COPY ./import-data.sh /import-data.sh
USER root
RUN chmod +x /import-data.sh
CMD /bin/bash ./entrypoint.sh
