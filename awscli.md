## How to get the full list of stacks in CloudFormation

```
aws --profile personal cloudformation list-stacks | jq '.StackSummaries[].StackName'
```

### Same but filtered by active only
```
aws --profile personal cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE | jq '.StackSummaries[].StackName'
```
