
rg="auxPercept"
region="westeurope"

adx_cluster_name="sergioadx"
adx_cluster_location="westeurope"
adx_cluster_tier="Basic"
adx_cluster_sku="Dev(No SLA)_Standard_E2a_v4"

adx_db_name="iotdata"
adx_db_table_name="sensordata"
adx_db_table_creation_script=".create table $adx_db_table_name (temperature: real, humidity: real)"

iot_hub_name="sergio"
iot_hub_consumer_group_name_for_adx="adx_cg"
