FROM ubuntu
WORKDIR /app
RUN apt-get -yqq update
RUN apt-get -yqq install python3-pip python3-dev curl gnupg
RUN apt install python3 -y
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apt-get install octave -y
COPY . .

EXPOSE 8000
CMD ["python3", "main.py"]
