setup:
	python3 -m venv ~/project_env && source ~/project_env/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		chmod +x ./hadolint		

test:
	python -m pytest

lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test