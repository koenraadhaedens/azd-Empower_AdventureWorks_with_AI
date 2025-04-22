param location string

param sqlServerName string
param sqlDatabaseName string
param sqlAdminUser string
@secure()
param sqlAdminPassword string
param azureOpenAIEndpoint string
param azureOpenAIKey string
param azureOpenAIDeployment string


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
    siteConfig: {
      appSettings: [
        {
          name: 'PORT'
          value: '3000'
        }
        {
          name: 'SQL_USER'
          value: sqlAdminUser
        }
        {
          name: 'SQL_PASSWORD'
          value: sqlAdminPassword
        }
        {
          name: 'SQL_SERVER'
          value: sqlServerName
        }
        {
          name: 'SQL_DATABASE'
          value: sqlDatabaseName
        }
        {
          name: 'AZURE_OPENAI_ENDPOINT'
          value: azureOpenAIEndpoint
        }
        {
          name: 'AZURE_OPENAI_KEY'
          value: azureOpenAIKey
        }
        {
          name: 'AZURE_OPENAI_DEPLOYMENT'
          value: azureOpenAIDeployment
        }
      ]
    } 
  }
  tags: {
    'azd-service-name': 'web'
  }
}

output webAppUrl string = 'https://${app.name}.azurewebsites.net'
