targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the environment that can be used as part of naming resource convention')
param environmentName string
param sqlAdminUser string
@secure()
param sqlAdminPassword string


// @minLength(1)
// @description('Primary location for all resources')
param location string


var tags = {
  'azd-env-name': environmentName
}

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}


module sql './sql.bicep' = {
  scope: rg
  name: 'sqlDeployment'
  params: {
    location: location
    adminUser: sqlAdminUser
    adminPassword: sqlAdminPassword
  }
}

module openai './openai.bicep' = {
  scope: rg
  name: 'openaiDeployment'
  params: {
    location: location
  }
}

module web './webapp.bicep' = {
  scope: rg
  name: 'webDeployment'
  params: {
    location: location
  }
}

output sqlServerName string = sql.outputs.sqlServerName
output databaseName string = sql.outputs.databaseName

