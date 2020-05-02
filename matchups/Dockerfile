FROM python:3.6

EXPOSE 5001

WORKDIR /matchups

COPY requirements.txt /matchups
RUN pip install -r requirements.txt

COPY matchups.py /matchups
ENTRYPOINT [ "python", "matchups.py" ]
