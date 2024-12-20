FROM python:3.13.0
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
ARG VERSAO
RUN sed -i 's/@VERSION@/'$VERSAO'/g' templates/index.html
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "-w", "4", "--timeout", "120"]
