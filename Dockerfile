FROM zricethezav/gitleaks:latest

WORKDIR /app

COPY . .

ENTRYPOINT ["gitleaks"]
