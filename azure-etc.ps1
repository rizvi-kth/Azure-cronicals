$resourceGroupName="rz-sb-test"
az resource list -g $resourceGroupName -o table

## Storage 
az storage account -h
az storage account list
az storage account create 

# Show all resource-group
az group list -o table
# Show the resource-group (Save the resource-group ID)
az group show -n container-play-rg

# Create the Service Principle using resource-group ID (Save the {name}, {password}, {appId}, {tenant})
az ad sp create-for-rbac
    --name "rz-sp-4-acs"
    --role "Contributor" 
    --scopes "/subscriptions/7ff1e000-f75b-459c-b6e3-a53ec6969486/resourceGroups/container-play-rg" 
    --password "Stained@@7"

# Check the SP details with {appId}
az ad sp show --id 5a462ddc-f5cd-4d31-b572-5f2335ea54a9

# Test SP with Logging in with SP
#az login --service-principal -u {appID} --password {password-or-path-to-cert} --tenant {tenant}
az login --service-principal -u 5a462ddc-f5cd-4d31-b572-5f2335ea54a9 
    --password Stained@@7 
    --tenant 58af3eba-510e-4544-8cfd-85f5e0206382

#Change SP credentian
#az ad sp reset-credentials --name {appID} --password {new-password}
az ad sp reset-credentials --name "5a462ddc-f5cd-4d31-b572-5f2335ea54a9" --password "d@ilyDr0p"
# {                                                   
#   "appId": "5a462ddc-f5cd-4d31-b572-5f2335ea54a9",  
#   "name": "5a462ddc-f5cd-4d31-b572-5f2335ea54a9",   
#   "password": "d@ilyDr0p",                          
#   "tenant": "58af3eba-510e-4544-8cfd-85f5e0206382"  
# }                                                   