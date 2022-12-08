### Add a new user
```
drush user-create YourUsername --mail="your@mail.com" --password="YourPassword"
```

### Make a user administrator
```
drush user-add-role "administrator" YourUsername
```

### Reset a user's password
```
drupal user:password:reset
```

Source: https://www.drupal.org/node/44164
