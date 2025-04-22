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

output openaiName string = openaiAccount.name
output openaiEndpoint string = openaiAccount.properties.endpoint
