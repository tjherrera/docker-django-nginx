FROM python:3.7

ENV PYTHONUNBUFFERED 1

RUN mkdir /opt/django_project
WORKDIR /opt/django_project

COPY ./python/requirements.txt /opt/django_project/
RUN pip install -r requirements.txt

COPY ./python /opt/django_project/

CMD [ "gunicorn", "--bind", ":8000", "project.wsgi" ]
