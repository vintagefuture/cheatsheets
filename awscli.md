## How to get the full list of stacks in CloudFormation

```
aws --profile personal cloudformation list-stacks | jq '.StackSummaries[].StackName'
```
