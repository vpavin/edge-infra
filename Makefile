.PHONY: install
install:
	ansible-galaxy install -r requirements.yml

.PHONY: edge
edge:
	ansible-playbook -i inventory/hosts.yml ./playbooks/edge.yml

.PHONY: edge-debug
edge-debug:
	ansible-playbook -i inventory/hosts.yml ./playbooks/edge.yml -vvvv