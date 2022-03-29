pip install virtualenv
virtualenv venv-pytest
source venv-pytest/bin/activate
pip install poetry
poetry install
#poetry export -f requirements.txt --output requirements.txt --without-hashes
#pip install -r requirements.txt
python -m pytest -m "unit" --cov=training --cov-config=./coverage.ini \
--cov-report=term-missing --cov-fail-under=60 -s -v -c custom_pytest.ini
python -m pytest -m "inte" --cov=training --cov-config=./coverage.ini \
--cov-report=term-missing --cov-fail-under=10 -s -v -c custom_pytest.ini
rtrn_code=$?
coverage erase
deactivate
rm -rf venv-pytest
exit $rtrn_code