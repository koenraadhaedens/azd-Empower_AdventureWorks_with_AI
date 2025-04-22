param location string
param adminUser string
@secure()
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: 'adventureworks-sql-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    administratorLogin: adminUser
    administratorLoginPassword: adminPassword
    publicNetworkAccess: 'Enabled'
  }
}

resource database 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  parent: sqlServer
  name: 'adventureworks'
  location: location
  properties: {
    sampleName: 'AdventureWorksLT'
  }
}


