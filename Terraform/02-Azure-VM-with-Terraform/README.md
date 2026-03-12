# Azure Ubuntu VM Creation using Terraform

This project demonstrates how to provision an Ubuntu Virtual Machine in Microsoft Azure using Terraform.

It is part of my **DevOps-Learning** repository and covers the following Azure resources:

- Resource Group
- Virtual Network
- Subnet
- Public IP
- Network Security Group (NSG)
- NSG Association
- Network Interface (NIC)
- Ubuntu Linux Virtual Machine

---

## Objective

The goal of this lab was to learn how to use **Terraform Infrastructure as Code (IaC)** to provision Azure infrastructure instead of creating resources manually through the Azure Portal.

---

## Tools Used

- Terraform
- Azure CLI
- Visual Studio Code
- Microsoft Azure
- SSH

---

## Project Files

- `main.tf` → Main Terraform configuration file for Azure infrastructure
- `README.md` → Documentation for this lab
- `screenshots/` → Evidence of outputs and successful execution

---

## Infrastructure Created

Terraform created the following Azure resources:

1. `azurerm_resource_group`
2. `azurerm_virtual_network`
3. `azurerm_subnet`
4. `azurerm_public_ip`
5. `azurerm_network_security_group`
6. `azurerm_subnet_network_security_group_association`
7. `azurerm_network_interface`
8. `azurerm_linux_virtual_machine`

---

## Step-by-Step Practice Performed

### Step 1: Open the Terraform project folder in VS Code

Opened the following folder:

```powershell
DevOps-Learning\Terraform\02-Azure-VM-with-Terraform

Expected result:

- The folder opens in VS Code

- Terraform files can be created inside this folder


### Step 2: Create `main.tf`

Created a file named:

```
main.tf
```

Added Terraform code to provision:

- Azure Resource Group  
- Virtual Network (VNet)  
- Subnet  
- Public IP  
- Network Security Group (NSG)  
- Network Interface (NIC)  
- Ubuntu Virtual Machine  

### Expected Result

- VS Code recognizes Terraform syntax  
- File is saved successfully  
- No syntax highlighting issues for valid Terraform blocks  

---

### Step 3: Generate SSH Key

Checked the SSH folder in PowerShell:

```powershell
dir $HOME\.ssh
```

### Expected Output

A list of files under the `.ssh` directory. In this case:

```
id_ed25519
id_ed25519.pub
known_hosts
known_hosts.old
```

This confirmed that the **SSH public key file already existed**.

---

### Step 4: Update Terraform SSH Key Path

Initially, the VM configuration was using the wrong public key file path.

### Incorrect Path

```terraform
public_key = file("C:/Users/Ani/.ssh/id_rsa.pub")
```

### Updated Correct Path

```terraform
public_key = file("C:/Users/Ani/.ssh/id_ed25519.pub")
```

### Expected Result

- Terraform can successfully read the SSH public key  
- Validation should no longer fail with **"no file exists"** error  

---

### Step 5: Initialize Terraform

Ran:

```bash
terraform init
```

### Expected Output

Terraform initializes the working directory and downloads the Azure provider plugin.

Typical message:

```
Terraform has been successfully initialized!
```

### Purpose

- Downloads required providers  
- Prepares the folder for Terraform commands  

---

### Step 6: Validate Terraform Code

Ran:

```bash
terraform validate
```

### Expected Output

```
Success! The configuration is valid.
```

### Purpose

- Confirms Terraform syntax is correct  
- Detects configuration issues before planning or creating resources  

---

### Step 7: Run Terraform Plan

Ran:

```bash
terraform plan
```

### Expected Output

Terraform shows the execution plan and lists the resources that will be created.

Important section:

```
Plan: 8 to add, 0 to change, 0 to destroy.
```

Terraform planned to create:

- Resource Group  
- Virtual Network  
- Subnet  
- Public IP  
- Network Security Group  
- NSG Association  
- Network Interface  
- Ubuntu VM  

### Purpose

Preview infrastructure changes before actual deployment.

---

### Step 8: Apply the Terraform Configuration

Ran:

```bash
terraform apply
```

When prompted, entered:

```
yes
```

### Expected Output

Terraform starts creating Azure resources one by one.

Typical final message:

```
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.
```

### Purpose

Actually provisions infrastructure in Azure.

---

### Step 9: Verify Resources in Azure Portal

Opened **Azure Portal** and verified that the following resources were created inside the resource group.

Resources created:

- `tf-vm-rg`
- `tf-vnet`
- `tf-subnet`
- `tf-public-ip`
- `tf-nsg`
- `tf-nic`
- `tf-ubuntu-vm`

### Expected Result

- All Terraform-created resources are visible in Azure Portal  
- Resource names match the Terraform configuration  

---

### Step 10: Get the VM Public IP and Connect Using SSH

Used SSH to connect to the Ubuntu VM:

```bash
ssh azureuser@172.190.147.64
```

When prompted for host authenticity, entered:

```
yes
```

### Expected Output

First connection adds the host to known hosts and opens the remote Ubuntu shell.

Typical messages:

```
Warning: Permanently added '172.190.147.64' (ED25519) to the list of known hosts.
Welcome to Ubuntu 22.04.5 LTS
azureuser@tfvm:~$
```

### Purpose

- Confirms NSG allows SSH on **port 22**
- Confirms VM is running and accessible from the internet

---

### Step 11: Verify Login Inside the VM

After successful SSH login, the terminal displayed the Ubuntu welcome banner and shell prompt:

```
azureuser@tfvm:~$
```

### Expected Result

Successfully logged into the VM and ready to run Linux commands.

This confirms:

- VM deployment succeeded  
- Public IP assignment worked  
- NIC and subnet were configured correctly  
- SSH key authentication worked successfully  

---

### Step 12: Destroy the Infrastructure

After testing, exited the VM and returned to the Terraform project folder.

Ran:

```bash
terraform destroy
```

When prompted, entered:

```
yes
```

### Expected Output

Terraform deletes all previously created resources.

Typical final message:

```
Destroy complete! Resources: 8 destroyed.
```

### Purpose

- Removes all Azure resources created by this lab  
- Prevents unnecessary Azure charges  
- Keeps the environment clean after practice  

---

### Issues Faced and Fixes

## 1. Wrong Subscription ID Used Initially

I mistakenly used the **Tenant ID** instead of the **Subscription ID**.

### Fix

Updated `subscription_id` in the Terraform provider block with the correct Azure Subscription ID.

---

## 2. Azure Provider Registration Conflict

Terraform returned provider registration conflicts during planning.

### Fix

Added the following to the provider block:

```terraform
resource_provider_registrations = "none"
```

This prevented Terraform from attempting automatic provider registrations that were conflicting in Azure.

---

## 3. Incorrect SSH Public Key Path

Terraform failed because `id_rsa.pub` did not exist.

### Fix

Updated the file path to the actual existing public key:

```terraform
file("C:/Users/****/.ssh/**********")
```

---

# Commands Used in This Lab

```bash
dir $HOME\.ssh
terraform init
terraform validate
terraform plan
terraform apply
ssh azureuser@<PUBLIC_IP>
terraform destroy
```

---

# Key Learning Outcomes

From this lab, I learned:

- How Terraform uses **Infrastructure as Code** to create Azure resources  
- How to structure **Azure infrastructure in Terraform**  
- How Azure resources depend on each other  
- How to authenticate Terraform with Azure  
- How to use **SSH keys with Azure Linux VMs**  
- How to preview infrastructure changes using `terraform plan`  
- How to provision infrastructure using `terraform apply`  
- How to safely remove resources using `terraform destroy`

