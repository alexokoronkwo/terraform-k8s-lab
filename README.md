# Terraform Kubernetes Lab

A small Terraform project that creates web apps on a local Kubernetes cluster, built to learn the Terraform workflow with the Kubernetes provider instead of a public cloud.

## What it does

A reusable module (`modules/web-app`) creates three Kubernetes resources for an app:

- a **namespace**
- a **deployment** (nginx, with a configurable replica count)
- a **service** that gives the pods a stable internal address

The root `main.tf` calls the module twice, as `blog` (2 replicas) and `shop` (3 replicas), each in its own namespace.

## Requirements

- Docker
- [kind](https://kind.sigs.k8s.io/), [kubectl](https://kubernetes.io/docs/tasks/tools/), and [Terraform](https://developer.hashicorp.com/terraform/install)
- Linux, macOS, or WSL

## Run it

```bash
kind create cluster --name terra-lab
terraform init
terraform plan
terraform apply
kubectl get pods -n team-a
kubectl get pods -n team-b
```

The provider uses your local kubeconfig and the `kind-terra-lab` context (set in `main.tf`).

Clean up with:

```bash
terraform destroy
kind delete cluster --name terra-lab
```

## Layout

| Path | Purpose |
|---|---|
| `main.tf` | Provider setup and the two module calls |
| `modules/web-app/` | Reusable module: variables, resources, outputs |
| `.gitignore` | Keeps state files and `.terraform/` out of Git |

## What I practiced

- The core loop: `init`, `plan`, `apply`, `destroy`
- Reading plans: `+` create, `~` update in place, `-` destroy
- Drift: scaled a deployment by hand with `kubectl`, then let Terraform detect and correct it
- Variables and outputs
- Modules: one definition reused for two apps
- State: why it should never be committed, and why teams use a shared remote backend with locking

## Notes

This runs on a local kind cluster for learning. For a real on-premise cluster, the same code works with a different kubeconfig context, and state would live in a shared backend instead of a local file.
