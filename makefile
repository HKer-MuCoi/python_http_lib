.PHONY: build clean install test lint cov

# TODO: Update your project folder
PROJECT=microservice_middleware

build:
	pipenv run python setup.py sdist bdist_wheel

clean:
	git clean -fxd

install:
	pip install pipenv
	pipenv install --dev --skip-lock

test:
	make lint && pipenv run pytest --doctest-modules --cov=microservice_middleware --cov-report=xml -v

lint:
	pipenv run pylint $(PROJECT)

cov:
	pipenv run codecov