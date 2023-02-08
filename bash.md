# Parse csv file
```bash
while IFS="," read -r value1 value2 value3
do
  .
  .
  .
done < <(tail -n +2 input.csv) # remove the header
```
