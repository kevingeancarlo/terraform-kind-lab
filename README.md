# terraform-kind-lab

Small hands-on lab: provision a local Kubernetes cluster with Terraform and deploy
a Helm chart on it, all from code.

## What it does

- Creates a 2-node [kind](https://kind.sigs.k8s.io/) cluster (1 control-plane + 1 worker)
  using the `tehcyx/kind` Terraform provider.
- Deploys a custom Helm chart (`charts/hello`, generated with `helm create`, runs nginx)
  using the `hashicorp/helm` provider (`helm_release`).
- The number of replicas is controlled by a Terraform variable that is passed to the
  chart's `replicaCount` value.

## Requirements

Docker, kind, kubectl, Helm and Terraform. Developed and tested in GitHub Codespaces.

## Usage

    terraform init
    terraform plan
    terraform apply

Check the result:

    kubectl --kubeconfig ~/.kube/kind-lab get pods -n demo
    helm --kubeconfig ~/.kube/kind-lab list -n demo

Change the replicas (default is 1) and review the plan before applying:

    echo 'replicas = 2' > terraform.tfvars
    terraform plan
    terraform apply

Clean up:

    terraform destroy

## Files

- `main.tf`: required providers and the kind cluster
- `helm.tf`: Helm provider and the `helm_release`
- `variables.tf` / `outputs.tf`: inputs and outputs
- `charts/hello`: the Helm chart

## Notes

- The Helm provider v3 uses attribute syntax (`kubernetes = { ... }`, `set = [ ... ]`),
  not the block syntax from v2.
- Terraform state is not committed (see `.gitignore`).
