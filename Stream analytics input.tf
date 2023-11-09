locals {
  stream_analytics_job_name = "Stream2"
  eventhub_consumer_group_name = "Default"
  eventhub_name = "ehub"
  servicebus_namespace = "Sayantan"
  shared_access_policy_key = "Cqr8B9EvcJjCMDHBkWMMLIoWddElnc729+AEhCqB3pQ="
  resource_group_name = "1234-dev"
}

resource "azurerm_stream_analytics_stream_input_eventhub" "example" {
  name                         = "e-eventhub2"   #Input alias may only contain alphanumeric characters and hyphens, and must be 3-63characters long.
  stream_analytics_job_name    = local.stream_analytics_job_name
  resource_group_name          = local.resource_group_name
  eventhub_consumer_group_name = local.eventhub_consumer_group_name
  eventhub_name                = local.eventhub_name
  servicebus_namespace         = local.servicebus_namespace
  shared_access_policy_key     = local.shared_access_policy_key
  shared_access_policy_name    = "RootManageSharedAccessKey"

  serialization {
    type     = "Json"
    encoding = "UTF8"
    # field_delimiter = ""  # Possible values are "space" , "comma" , "tab" , "pipe" , ";" (only required in case of CSV)
  }
}