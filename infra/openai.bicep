param location string

resource openaiAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'openai-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    apiProperties: {
      customSubDomainName: 'openai-${uniqueString(resourceGroup().id)}'
      enableDeploymentModelSelection: true
    }
    networkAcls: {
      defaultAction: 'Allow'
    }
  }
}



resource openaiDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openaiAccount
  name: 'gpt35'
  properties: {
    model: {
      name: 'gpt-35-turbo'
      format: 'OpenAI'
      version: '0301'  // or current one
    }
    scaleSettings: {
      scaleType: 'Standard'
    }
  }
}

output openaiEndpoint string = openai.properties.endpoint
output openaiKey string = listKeys(openai.id, openai.apiVersion).key1
