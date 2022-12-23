# README

Demonstrate how to import data from different places

## Initialise

```sh
# init the providers
terraform init
```

## Create

The example pulls in a json file and writes out a set of files.  
Ideally this would be creating DNS records from the json doc.  

```sh
# plan
terraform plan -var records_file="./dns/test_records.json"

# apply 
terraform apply -auto-approve -var records_file="./dns/test_records.json"
```

## Adding new resources

NOTE: Here we are checking that we don't introduce a [destroy, create] cycle.  

```sh
# plan
terraform plan -var records_file="./dns/test_records_add.json"

# apply 
terraform apply -auto-approve -var records_file="./dns/test_records_add.json"
```

## Delete resources

NOTE: Only the deleted resource should be deleted  

```sh
# plan
terraform plan -var records_file="./dns/test_records_delete.json"

# apply 
terraform apply -auto-approve -var records_file="./dns/test_records_delete.json"
```

## Reorder resources

NOTE: Reordering should have no impact. But it seems to [delete, create] the file.  

```sh
# plan
terraform plan -var records_file="./dns/test_records_reorder.json"

# apply 
terraform apply -auto-approve -var records_file="./dns/test_records_reorder.json"
```

## Resources

* 2021-01-25-ForLoops from terraform tuedays [here]](https://github.com/ned1313/terraform-tuesdays/tree/main/2021-01-25-ForLoops)  
* when-to-use-for_each-instead-of-count [here](https://www.terraform.io/language/meta-arguments/count#when-to-use-for_each-instead-of-count)  