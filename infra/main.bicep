param location string = resourceGroup().location
param sqlAdminUser string
@secure()
param sqlAdminPassword string

module sql './sql.bicep' = {
  name: 'sqlDeployment'
  params: {
    location: location
    adminUser: sqlAdminUser
    adminPassword: sqlAdminPassword
  }
}

module openai './openai.bicep' = {
  name: 'openaiDeployment'
  params: {
    location: location
  }
}

module web './webapp.bicep' = {
  name: 'webDeployment'
  params: {
    location: location
  }
}
