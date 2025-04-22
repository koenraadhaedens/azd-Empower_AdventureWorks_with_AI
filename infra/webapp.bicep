param location string

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'awhackathon-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

resource app 'Microsoft.Web/sites@2022-03-01' = {
  name: 'aw-hackathon-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    serverFarmId: plan.id
  }
  tags: {
    'azd-service-name': 'web'
  }
}

output webAppUrl string = 'https://${app.name}.azurewebsites.net'
