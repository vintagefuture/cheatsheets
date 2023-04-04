## Parse csv file
```bash
while IFS="," read -r value1 value2 value3
do
  .
  .
  .
done < <(tail -n +2 input.csv) # remove the header
```

## Working with dates
```
dates=('06/Feb/2023:08:56:18.059' '06/Feb/2023:08:58:31.458')

for i in "${!account_id[@]}"; do
  IFS="/:." read -r h m s ms <<<"$time_stamp[i]"
done


output_date1="$(echo $h $m $s $ms)"


echo $output_date1
```

## Watch a specific process

```
watch 'ps -o command | grep ^curl'
```

## Replace a pattern between patterns
```
sed -i '/pattern1/, /pattern2/' s/true/false' config.xml
```
