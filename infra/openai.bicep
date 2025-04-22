param location string
param openaiName string = 'openai-${uniqueString(resourceGroup().id)}'

resource openaiAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openaiName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
  properties: {
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
}

resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-03-01-preview' = {
  parent: openaiAccount
  name: 'gpt35'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0125'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 0
    }
  }
}

output openaiName string = openaiAccount.name
output openaiEndpoint string = openaiAccount.properties.endpoint
