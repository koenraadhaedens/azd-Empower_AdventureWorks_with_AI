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

resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openaiAccount
  name: 'gpt35'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '1106'
    }
  }
  sku: {
    name: 'GPT-35-Turbo'
    capacity: 1
  }
}

output openaiName string = openaiAccount.name
output openaiEndpoint string = openaiAccount.properties.endpoint

// output openaiKey string = listKeys(openaiAccount.id, '2023-05-01').key1
// output deploymentName string = openaiDeployment.name
