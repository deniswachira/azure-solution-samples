az group create --location northeurope --resource-group azure-traffic-manager-introduction

az appservice plan create \
  --name web-eastus2-plan \
  --resource-group azure-traffic-manager-introduction \
  --location eastus2 \
  --sku S1
  
appname=demo-web-eastus2-$RANDOM$RANDOM
az webapp create \
  --name $appname \
  --resource-group azure-traffic-manager-introduction \
  -p web-eastus2-plan
  
az appservice plan create \
  --name web-northeurope-plan \
  --resource-group azure-traffic-manager-introduction \
  --location northeurope \
  --sku S1
  
appname=demo-web-northeurope-$RANDOM$RANDOM
az webapp create \
  --name $appname \
  --resource-group azure-traffic-manager-introduction \
  -p web-northeurope-plan
  
az webapp list -g azure-traffic-manager-introduction --query "[].enabledHostNames" -o jsonc

