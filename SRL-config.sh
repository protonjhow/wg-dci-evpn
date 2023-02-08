#!/bin/sh
gnmic -a clab-wg-dci-evpn-dc-srl1 --timeout 30s -u admin -p admin -e json_ietf --skip-verify set --update-path / --update-file dc-srl1.yaml
docker exec clab-wg-dci-evpn-dc-srl1 sr_cli "save startup"
gnmic -a clab-wg-dci-evpn-dc-srl2 --timeout 30s -u admin -p admin -e json_ietf --skip-verify set --update-path / --update-file dc-srl2.yaml
docker exec clab-wg-dci-evpn-dc-srl2 sr_cli "save startup"
gnmic -a clab-wg-dci-evpn-dc-srl3 --timeout 30s -u admin -p admin -e json_ietf --skip-verify set --update-path / --update-file dc-srl3.yaml
docker exec clab-wg-dci-evpn-dc-srl3 sr_cli "save startup"
