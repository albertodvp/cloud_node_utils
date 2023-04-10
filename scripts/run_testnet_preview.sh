#!/bin/bash


NET=$1

if ! [[ "$NET" =~ ^(preview|preprod|mainnet)$ ]]; then
    echo "Usage: $NET (select one in preview|preprod|mainnet)"
    exit 1
fi

CONFIG_FILE_DIR="$CARDANO_DATA/$NET"
NET_DATA="$CARDANO_DATA/$NET/db"

mkdir "$NET_DATA" -p

$HOME/cardano-node/cardano-node-build/bin/cardano-node run \
             --topology "$CONFIG_FILE_DIR/topology.*json" \
             --database-path "$CARDANO_DATA" \
             --socket-path "$CONFIG_FILE_DIR/node.socket" \
             --host-addr 0.0.0.0 \
             --port 3001 \
             --config "$CONFIG_FILE_DIR/config.json"
