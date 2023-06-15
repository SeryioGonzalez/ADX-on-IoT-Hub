source config.sh

echo "Creating table $adx_db_table_name on DB $adx_db_name cluster $adx_cluster_name"
az kusto script create --cluster-name $adx_cluster_name --database-name $adx_db_name -g $rg -n create_table --script-content "$adx_db_table_creation_script"

echo "Creating consumer group $iot_hub_consumer_group_name_for_adx on IoT Hub $iot_hub_name"
az iot hub consumer-group create --hub-name $iot_hub_name -n $iot_hub_consumer_group_name_for_adx -g $rg 

iot_hub_resource_id=$(az iot hub show -n sergio -g auxPercept --query id -o tsv)

echo "Creating connection to IoT Hub $iot_hub_name from ADX cluster $adx_cluster_name on DB $adx_db_name to table $adx_db_table_name"

az kusto data-connection iot-hub create -g $rg --cluster-name $adx_cluster_name --database-name $adx_db_name -n iot-hub-to-adx --consumer-group $iot_hub_consumer_group_name_for_adx \
 --table-name $adx_db_table_name --iot-hub-resource-id "$iot_hub_resource_id" --shared-access-policy-name iothubowner --data-format JSON --event-system-properties iothub-connection-device-id