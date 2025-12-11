# Virtual Network Module

Terraform module for creating Azure Virtual Networks with subnets.

## Usage
```hcl
module "vnet" {
  source = "./modules/virtual-network"
  
  resource_group_name = "rg-production"
  location           = "East US"
  vnet_name          = "vnet-prod-001"
  address_space      = ["10.0.0.0/16"]
  
  subnets = {
    web = "10.0.1.0/24"
    app = "10.0.2.0/24"
    db  = "10.0.3.0/24"
  }
  
  tags = {
    Environment = "Production"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Azure resource group | string | - | yes |
| location | Azure region | string | "East US" | no |
| vnet_name | VNet name | string | - | yes |
| address_space | VNet address space | list(string) | ["10.0.0.0/16"] | no |
| subnets | Subnet configuration | map(string) | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet_id | Virtual network ID |
| vnet_name | Virtual network name |
| subnet_ids | Map of subnet IDs |
```

**Commit this file**

---

## **✅ YOUR FIRST REPO IS LIVE!**

Your repository now has:
- ✅ Professional README
- ✅ Complete Terraform module
- ✅ Proper structure
- ✅ Documentation

**URL:** `https://github.com/OfficialMrDipak/azure-terraform-modules`

---

## **🎯 NEXT STEPS - WHICH ONE DO YOU WANT?**

**Reply with a number:**

1️⃣ **Create 2nd repo: jenkins-pipeline-library** (Jenkins shared libraries)  
2️⃣ **Create 3rd repo: ansible-linux-automation** (Ansible playbooks)  
3️⃣ **Create 4th repo: azure-devops-pipelines** (YAML pipeline examples)  
4️⃣ **Create 5th repo: shell-scripts-library** (Bash automation scripts)  
5️⃣ **Update your LinkedIn profile** (with GitHub link + optimized About section)  
6️⃣ **Get interview Q&A** (DevOps questions with your experience-based answers)  

**OR tell me:** "Create all 5 repos at once" and I'll give you quick-start commands for each! 🚀

---

**Pro Tip:** After creating 2-3 repos, update your resume's **GitHub line** to:
```
GitHub: github.com/OfficialMrDipak (3+ production-ready repositories)
