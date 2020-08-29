index:
	for d in $$(ls -d */); do helm package $$d; done
	helm repo index .
