#set env vars
set -o allexport; source .env; set +o allexport;


chmod +x ./localstack_bootstrap.sh

SESSION_SECRET=$(openssl rand -hex 32)
AUTHENTICATION_GLOBAL_AUTH_TOKEN=$(openssl rand -hex 32)
AUTHENTICATION_JWT_SECRET=$(openssl rand -hex 32)

cat << EOT >> ./.env

SESSION_SECRET=${SESSION_SECRET}
AUTHENTICATION_GLOBAL_AUTH_TOKEN=${AUTHENTICATION_GLOBAL_AUTH_TOKEN}
AUTHENTICATION_JWT_SECRET=${AUTHENTICATION_JWT_SECRET}
EOT

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 52368,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT