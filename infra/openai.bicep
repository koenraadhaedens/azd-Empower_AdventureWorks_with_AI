param location string

resource openai 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'openai-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    apiProperties: {
      customSubDomainName: 'openai-${uniqueString(resourceGroup().id)}'
    }
    networkAcls: {
      defaultAction: 'Allow'
    }
  }
}

output openaiEndpoint string = openai.properties.endpoint
output openaiKey string = listKeys(openai.id, openai.apiVersion).key1
