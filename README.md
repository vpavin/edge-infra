# Edge Cloud IaC

This repository contains the IaC of edge service running on Digital Ocean cloud.

It uses a pair of proxy servers communicating to my internal homelab server through a [Tailscale](https://tailscale.com) network (vpn).

## Architecture Diagram

![Diagram](docs/infra.png#gh-light-mode-only)
![Diagram](docs/infra-dark.png#gh-dark-mode-only)

## Components

Component | Description
-- | --
gateway | Nginx server with stream module and enabled TLS exposed to the internet through Cloudflare DNS.
proxy | Nginx server with stream module. This component is responsible to expose UDP ports on tailnet to internal docker network to be accessed by gateway component.
tailscale | VPN agents
palserver | The only exposed service on homelab so far

## How to build edge services

Edge services are configured through an Ansible Playbook. To execute the playbook you need have both Ansible and make installed on your machine.

1. On `inventory/` directory, copy the file `hosts-template.yml`, renaming it to `hosts.yml`;
2. Provide the missing attributes on double curly braces of the file (server address, tailscale authentication key and ansible username to connect)
3. Install a ssh key on your host to connect to the target machine (avoid using passkey);
4. Install the required ansible galaxy libraries and execute the `edge` command:

```shell
> make install
Starting galaxy collection install process

> make edge
ansible-playbook -i inventory/hosts.yml ./playbooks/edge.yml

PLAY [Configure edge gateway] ****************************************************************************************************************************************************

...
````

