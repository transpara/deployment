FROM python:3.9-alpine

COPY simulator.py .
COPY metrics.txt .

RUN pip install requests

CMD ["python", "-u", "simulator.py"]