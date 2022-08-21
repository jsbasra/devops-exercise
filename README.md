# DevOps Exercise

This project is meant to test skills for the VoteShield DevOps Engineer role. What it does is not that important.

See [./INSTRUCTIONS.md](./INSTRUCTIONS.md) to get started.

## Usage

This exercise provides a "thing" REST API.

- `/things`: List all things
- `/things/<id>`: List specific thing

## Install

### Dependencies:

- Python >3.9

First download and install [python](https://www.python.org/downloads/). Additional dependecies are then managed with [poetry](https://python-poetry.org/)

- poetry installation with bash: \
 `curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -`

- poetry installation with PowerShell: \
 `(Invoke-WebRequest -Uri https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py -UseBasicParsing).Content | python -`

After installation, add poetry to path: \

- with PowerShell:  `$env:path += "$HOME\.poetry\bin;"`
- with Bash: `export PATH="$PATH:/root/.poetry/bin"`

Now, Poetry can be used to install the project dependencies, which are listed in `pyproject.toml` with specifc versions contained in `poetry.lock`. Both of these files are in the root of the project. Therefore, make sure the terminal has working directory at the repository root. Then, run the command:\
`poetry install`

## Development

To run the thing application, at the repository root execute:

- `poetry run python app/main.py &`

The thing application will run at localhost on port 5000. If there are issues NOTES.md has troubleshooting tips. 

## Testing

To run Unit tests:

- `poetry run python tests.py`

## Deployment

Github actions are used to deploy the application. The pipeline is set to execute on each commit to the main branch and when a pull request is created. The workflow can be examined in the repo under `.github/workflows`. This worklow uses pylint as linter to statically anlyize code and then builds the application. The `tests.py` script is run and upon passing a docker image is created contained the app. The goal will be to upload this image in AWS container service such as AWS Lambda.

## Credits

- Inspiration from [bregman-arie/devops-exercises](https://github.com/bregman-arie/devops-exercises)