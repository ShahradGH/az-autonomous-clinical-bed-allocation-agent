param location string = resourceGroup().location
resource workspace 'Microsoft.HealthcareApis/workspaces@2023-11-01' = {
  name: 'hcw-clinical-bed-safety'
  location: location
}
