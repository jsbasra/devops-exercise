FROM python:latest

ENV PYTHONDONTWRITEBYTECODE 1 \
    PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install curl -y \
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

ENV PATH="${PATH}:/root/.poetry/bin"


COPY ./pyproject.toml ./
COPY ./poetry.lock ./
RUN poetry install --no-interaction

# Provide a known path for the virtual environment by creating a symlink
RUN ln -s $(poetry env info --path) /var/my-venv

# Clean up project files. You can add them with a Docker mount later.
RUN rm pyproject.toml poetry.lock
RUN mkdir /app
COPY ./app/ /app
WORKDIR /app

EXPOSE 5000

CMD [ "poetry", "run", "python", "main.py", "&" ]