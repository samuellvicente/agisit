#!/bin/bash
echo "WARNING: Be sure to have the correct values in terraform.tfvars file in the /gcp/ directory"
echo "WARNING: Be ensure that Docker engine is running"
read -n 1 -s -r -p "Press any key to continue, ^C to cancel"

cd gcp &&

project_id=`awk '$1 == "project"  {gsub(/"/, "", $3); print $3}' terraform.tfvars` &&
repo_region=`awk '$1 == "region"  {gsub(/"/, "", $3); print $3}' terraform.tfvars` &&
repo_id=`awk '$1 == "registry"  {gsub(/"/, "", $3); print $3}' terraform.tfvars` &&

sed 's:\.\/:\.\.\/:' terraform.tfvars > ./registry/terraform.tfvars &&

cd registry/ &&

terraform init &&
terraform apply -auto-approve &&
gcloud auth login &&
gcloud config set project ${project_id} &&
gcloud auth configure-docker ${repo_region}-docker.pkg.dev &&
cd ../../microservices

(cd bootstorage/ &&
chmod +x build.sh &&
./build.sh &&
docker tag bootstorage ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/bootstorage &&
docker push ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/bootstorage ) &

(cd expressed/ &&
chmod +x build.sh &&
./build.sh &&
docker tag expressed ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/expressed &&
docker push ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/expressed) &

(cd happy/ &&
chmod +x build.sh &&
./build.sh &&
docker tag happy ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/happy &&
docker push ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/happy) &

(cd vuecalc/ &&
chmod +x build.sh &&
./build.sh &&
docker tag vuecalc ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/vuecalc &&
docker push ${repo_region}-docker.pkg.dev/${project_id}/${repo_id}/vuecalc) &
