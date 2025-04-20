provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  namespace        = "argocd"
  create_namespace = true
  version          = "5.46.6"

  force_update     = true        # Ensures Helm release is updated if drift is detected
  recreate_pods    = true        # Restarts pods on update
  timeout          = 600         # Wait time for deployment

  # Optional: Use your existing values file
  # values = [ file("argocd-values.yaml") ]
}
