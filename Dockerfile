FROM python:3.10-slim

ENV FLASK_ENV=development

RUN apt-get update && apt-get install -y \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libglib2.0-0 \
    libgl1-mesa-glx

WORKDIR /app

COPY . .

RUN pip install -r src/requirements.txt

RUN git clone https://github.com/githubharald/CTCWordBeamSearch && \
	mkdir -p static/uploads && \
    cd CTCWordBeamSearch && \
    pip install .

WORKDIR /app/src

EXPOSE 3000

CMD ["python", "app.py"]
