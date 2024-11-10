resource "argocd_application" "App" {
  metadata {
    name      = "Quiz-app-using-terraform"
    namespace = var.namespace
    labels = {
      test = "true"
    }
  }

  spec {
    project = var.argocd_project  

    destination {
      server    = var.destination_server   
      namespace = var.destination_namespace 
    }

    source {
      repo_url        = var.repo_url           
      path            = var.path               
      target_revision = var.target_revision    
    }

    sync_policy {
      automated {
        prune      = true  
        self_heal  = true  
      }
      sync_options = [
        "CreateNamespace=true"  
      ]
    }
  }
}
