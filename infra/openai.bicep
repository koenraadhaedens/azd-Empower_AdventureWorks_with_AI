param location string

var openAiAccountName = 'openai-${uniqueString(resourceGroup().id)}'
var openAiDeploymentName = 'gpt35'

resource openaiAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
    apiProperties: {
      enableDeploymentModelSelection: true
    }
  }
}

resource openaiDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openaiAccount
  name: openAiDeploymentName
  properties: {
    model: {
      name: 'gpt-35-turbo'
      format: 'OpenAI'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
    }
  }
}

output openaiEndpoint string = openaiAccount.properties.endpoint
// output openaiKey string = listKeys(openaiAccount.id, '2023-05-01').key1
output deploymentName string = openaiDeployment.name
