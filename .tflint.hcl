config {
  # Inspects local modules called by your root configuration
  call_module_type = "local"
  force            = false
}

# Core Terraform language rules (built-in recommended checks)
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# The AWS-specific ruleset plugin
plugin "aws" {
  enabled = true
  version = "0.49.0" # Use the latest version matching your workspace requirements
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  
  # Optional: default region for AWS resource constraint checks
  region  = "us-east-1"
}
