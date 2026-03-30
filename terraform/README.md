# Terraform Azure Setup


## Required Variables

- `ARM_CLIENT_ID`
- `ARM_CLIENT_SECRET`
- `ARM_SUBSCRIPTION_ID`
- `ARM_TENANT_ID`
- `AZURE_CREDENTIALS` with an entry like
```json
{
  "clientId": "clientid",
  "clientSecret": "YOUR_CLIENT_SECRET",
  "subscriptionId": "subscription",
  "tenantId": "tenantid",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```


## Steps

1. **Create Storage Account (before Terraform)**
   ```sh
# Create storage account for Terraform state in your existing resource group
az storage account create \
  --name "tfstatenito" \
  --resource-group "rg-devel-nito" \
  --location "spaincentral" \
  --sku "Standard_LRS"

# Create container for state files
az storage container create \
  --name "tfstate" \
  --account-name "tfstatenito"
   ```
   Replace the placeholders with your values. This must be done before running Terraform.

2. **Terraform Init & Apply**
   ```sh
   cd terraform
   terraform init
   terraform apply -auto-approve
   ```
3. **Push Docker Image to ACR**
   ```sh
   ./push_image.sh <acr_login_server> <acr_username> <acr_password> <docker_image_name>
   ```
   Use outputs from Terraform for ACR credentials.

4. **Run Karate Tests**
   Set `API_BASE_URL` to the Azure Function URL output by Terraform and run Karate tests.

5. **Teardown**
   ```sh
   terraform destroy -auto-approve
   ```
