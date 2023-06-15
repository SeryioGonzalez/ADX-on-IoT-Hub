source config.sh

echo "Creating cluster $adx_cluster_name"
az kusto cluster create  --cluster-name $adx_cluster_name --sku name="$adx_cluster_sku" tier=$adx_cluster_tier -g $rg --location $adx_cluster_location

echo "Creating DB $adx_db_name"
az kusto database create --cluster-name $adx_cluster_name --database-name $adx_db_name -g $rg  --read-write-database soft-delete-period=P365D hot-cache-period=P31D location=$adx_cluster_location