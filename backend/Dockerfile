FROM python:3.6

EXPOSE 5000

WORKDIR /backend

COPY requirements.txt /backend
COPY config.json /backend
RUN pip install -r requirements.txt

COPY backend.py /backend
ENTRYPOINT [ "python", "backend.py" ]
