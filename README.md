# Instructions for DEVNET-6

Run: 
- Interactive: `docker run --name explorer-devnet-6 -p 8080:8080 bernalraul/pingexplorer-devnet6`
- Deteached: `docker run --name explorer-devnet-6 -d -p 8080:8080 bernalraul/pingexplorer-devnet6`

## Re-create the docker files after changes (manually)
After a new update, recreate the docker image and push to the Docker Hub using:
- `docker buildx build --push --platform linux/arm64/v8,linux/amd64  --tag bernalraul/pingexplorer-devnet6 .`
- Get the last image from the Hub server: `docker pull bernalraul/pingexplorer-devnet6`
- Stop and remove the container: `docker stop explorer-devnet-6 && docker rm -v explorer-devnet-6`
- Re-create the container again with the new image: `docker run --name explorer-devnet-6 -d -p 8080:8080 bernalraul/pingexplorer-devnet6`


## Create the systemd file:
```bash
cat <<'EOF' >>docker-explorer-devnet-6.service
[Unit]
Description=explorer-devnet-6 container  
Requires=docker.service  
After=docker.service

[Service]
Restart=always  
ExecStart=/usr/bin/docker start -a explorer-devnet-6  
ExecStop=/usr/bin/docker stop -t 2 explorer-devnet-6

[Install]
WantedBy=default.target
EOF
```

## Move it, enable in the init and start it
```bash
sudo mv docker-explorer-devnet-6.service /lib/systemd/system/
sudo systemctl enable docker-explorer-devnet-6.service && sudo systemctl start docker-explorer-devnet-6.service && sudo journalctl -fu docker-explorer-devnet-6 -o cat
```

<div align="center">
![Ping Wallet](./public/logo.svg)

<h1>Ping Dashboard</h1>
**Ping Dashboard is not only an explorer but also a wallet and more ... 🛠**

[![version](https://img.shields.io/github/tag/ping-pub/explorer.svg)](https://github.com/ping-pub/explorer/releases/latest)
[![GitHub](https://img.shields.io/github/license/ping-pub/explorer.svg)](https://github.com/ping-pub/explorer/blob/master/LICENSE)
[![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/bukotsunikki.svg?style=social&label=Follow%20%40ping_pub)](https://twitter.com/ping_pub)
[![https://discord.gg/CmjYVSr6GW](https://img.shields.io/badge/discord-join-7289DA.svg?logo=discord&longCache=true&style=flat)](https://discord.gg/CmjYVSr6GW)


</div>

`Ping Dashboard` is a light explorer for Cosmos-based Blockchains.  https://ping.pub .

## What sets Ping Dashboard apart from other explorers?
**Ping Dashboard** stands out by providing a real-time exploration of blockchain data without relying on caching or pre-processing. It exclusively fetches data from the Cosmos full node via LCD/RPC endpoints, ensuring a truly authentic experience. This approach is referred to as the "Light Explorer."

## Are you interested in listing your blockchain on https://ping.pub?

To make this repository clean, please submit your request to https://github.com/ping-pub/ping.pub.git


## Why does Ping Dashboard rely on official/trusted third-party public LCD/RPC servers?
There are two primary reasons for this choice:

 - Trust: In a decentralized system, it is crucial to avoid relying solely on a single entity. By utilizing official/trusted third-party public LCD/RPC servers, Ping Dashboard ensures that the data is sourced from a network of trusted participants.
 - Limited Resources: As Ping Dashboard plans to list hundreds of Cosmos-based blockchains in the future, it is impractical for the Ping team to operate validators or full nodes for all of them. Leveraging trusted third-party servers allows for more efficient resource allocation.

## Donation

Your donation will help us make better products. Thanks in advance.

 - Address for ERC20: USDC, USDT, ETH
```
0x88BFec573Dd3E4b7d2E6BfD4D0D6B11F843F8aa1
```

#### Donations from project

- Point Network: 1000USDC and $1000 worth of POINT
- Bitsong: 50k BTSG
- IRISnet: 100k IRIS

## Hire us

You can hire us by submiting an issue and fund the issue on [IssueHunter](https://issuehunt.io/r/ping-pub/explorer)


## Contributors

Developers: @liangping @dingyiming

