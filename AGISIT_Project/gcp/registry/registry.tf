resource "google_artifact_registry_repository" "main" {
  provider = google-beta

  repository_id = var.registry
  description   = "Docker images repository"
  format        = "DOCKER"

  #region, must be specified here instead of in the provider configuration, as
  # its bugged https://github.com/hashicorp/terraform-provider-google/issues/10436
  location = var.region
}
