#!/usr/bin/with-contenv bashio

echo "[ora2mqtt] Starte Konfiguration..."

username=$(bashio::config 'username')
password=$(bashio::config 'password')
country=$(bashio::config 'country')
mqtt_server=$(bashio::config 'mqtt_server')
mqtt_topic_prefix=$(bashio::config 'mqtt_topic_prefix')
mqtt_user=$(bashio::config 'mqtt_user')
mqtt_password=$(bashio::config 'mqtt_password')

CONFIG_DIR="/data/addon_configs/ora2mqtt"
CONFIG_PATH="$CONFIG_DIR/config.yaml"

mkdir -p "$CONFIG_DIR"

cat <<EOF > "$CONFIG_PATH"
deviceId: $(uuidgen | tr -d '-')
country: $country

account:
  username: "$username"
  password: "$password"
  accessToken: ""
  refreshToken: ""

mqtt:
  server: "$mqtt_server"
  topicPrefix: "$mqtt_topic_prefix"
  clientId: "ora2mqtt"
  user: "$mqtt_user"
  password: "$mqtt_password"
EOF

echo "[ora2mqtt] Konfiguration gespeichert unter $CONFIG_PATH"
echo "[ora2mqtt] Starte Anwendung..."

exec dotnet /app/Ora2Mqtt.dll --config "$CONFIG_PATH"
