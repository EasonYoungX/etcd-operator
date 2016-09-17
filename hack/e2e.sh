#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

mkdir -p _output/bin || true

option="${1}"
case ${option} in
   "setup") go build -o _output/bin/e2e-setup ./test/e2e/framework/setup/main.go
			_output/bin/e2e-setup --kubeconfig ${KUBERNETES_KUBECONFIG_PATH}
   ;;
   "teardown") go build -o _output/bin/e2e-teardown ./test/e2e/framework/teardown/main.go
			_output/bin/e2e-teardown --kubeconfig ${KUBERNETES_KUBECONFIG_PATH}
   ;;
   *) echo "Unknown option ${option}"
   ;;
esac