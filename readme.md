# Debian 12 basic VM

### Prepare environment
```
export TWC_TOKEN=<token>
export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret_key>
```

### Init, plan and deploy
```
alias tf=terraform
tf init -reconfigure
tf plan
tf apply -auto-approve
```

### Delete vm
```
tf destroy -auto-approve
```