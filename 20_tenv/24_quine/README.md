# QUINE

A bit of fun to create a quine in Terraform.  

A quine is a computer program which takes no input and produces a copy of its own source code as its only output. The standard terms for these programs in the computability theory and computer science literature are "self-replicating programs", "self-reproducing programs", and "self-copying programs".  

## Replicate

```sh
# apply the plan
terraform init && terraform apply --var-file=terraform.tfvars --auto-approve && cd ./output
```

## Destroy

```sh
popd && terraform destroy --var-file=terraform.tfvars --auto-approve
```

## Troubleshooting

```sh
terraform console --var-file=terraform.tfvars
```

## Resources
