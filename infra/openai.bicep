param location string
param openaiName string = 'openai-${uniqueString(resourceGroup().id)}'
param sku string = 'S0'
resource openAIService 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: openaiName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  kind: 'AIServices'
  sku: {
    name: sku
  }
  properties: {
    customSubDomainName: openaiName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
}

resource azopenaideployment 'Microsoft.CognitiveServices/accounts/deployments@2024-10-01' = {
  parent: openAIService
  name: 'GPT35'
  properties: {
      model: {
          format: 'OpenAI'
          name: 'gpt-4'
          version: 'turbo-2024-04-09'
      }
  }
  sku: {
    name: 'Standard'
    capacity: 80
  }
}

output openaiName string = openAIService.name
output openaiEndpoint string = openAIService.properties.endpoint
