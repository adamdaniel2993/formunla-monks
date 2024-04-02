FROM python:alpine3.19
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY formulatest .
ARG IMAGENV
ENV IMAGENV=${IMAGENV}
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
