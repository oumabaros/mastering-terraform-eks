#!/bin/bash
cd backend/FleetAPI
pack build ecr-fleet-portal-dev-backend:2024.06.6 --builder paketobuildpacks/builder-jammy-base
cd ../../frontend/FleetPortal
pack build ecr-fleet-portal-dev-frontend:2024.05.14 --builder paketobuildpacks/builder-jammy-base
cd ../../
docker images 

docker tag ecr-fleet-portal-dev-backend:2024.06.6 \
 000000000000.dkr.ecr.us-east-1.localhost.localstack.cloud:4566/ecr-fleet-portal-dev-backend:2024.06.6

docker tag ecr-fleet-portal-dev-frontend:2024.05.14 \
 000000000000.dkr.ecr.us-east-1.localhost.localstack.cloud:4566/ecr-fleet-portal-dev-frontend:2024.05.14

docker images