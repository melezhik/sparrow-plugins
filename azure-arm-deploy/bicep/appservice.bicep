param sku string = 'F1' // The SKU of App Service Plan
param linuxFxVersion string = 'node|14-lts' // The runtime stack of web app
param location string = resourceGroup().location // Location for all resources
param appServicePlanName string
param webSiteName string

var slots = [
  'rc'
  'stage'
]

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'linux'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }

  resource hostname_bind 'hostNameBindings' = {
    name: '${webSiteName}.azurewebsites.net'
    // location: location
    properties: {
      siteName: webSiteName
      hostNameType: 'Verified'
    }
  }

  resource slot 'slots@2021-02-01' = [for s in slots: {
    name: s
    location: location
    kind: 'app,linux'
    properties: {
      enabled: true
      // hostNameSslStates: [
      //  {
      //    name: '${webSiteName}-${s}.azurewebsites.net'
      //    sslState: 'Disabled'
      //    hostType: 'Standard'
      //  }
      // ]
      // serverFarmId: serverfarms_assmt_prod_externalid
      siteConfig: {
        linuxFxVersion: linuxFxVersion
      }

    }

  }]

}
