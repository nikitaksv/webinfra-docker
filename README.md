# nindeco
---
### Bind setup
In container run command
```sh
apt-get update && apt-get -y install mc
mcedit /etc/webmin/config
```
and paste  
```
referers=bind.nindeco.com  
```
and change  
```
referers_none=1  
```
on  
 ```
 referers_none=0  
 ```

### Mail setup
Run command:
```sh
./mail_config.sh email add admin@nindeco.com
./mail_config.sh config dkim 2048
```

### Redmine Ldap configuration:

    Name     = Some random description
    Host     = ldap
    Port     = 389
    LDAPS    = no
    Account  = cn=redmine,ou=services,dc=nindeco,dc=com
    Password = defender
    Base DN  = ou=people,dc=nindeco,dc=com  
    Filter   = (&(objectClass=posixAccount)(memberof=cn=users,ou=groups,dc=nindeco,dc=com))

    On-the-fly user creation = yes
    Attributes:
    Login     = uid
    Firstname = givenName
    Lastname  = sn
    Email     = mail

---
### Gitlab SMTP documentation: 
https://docs.gitlab.com/omnibus/settings/smtp.html

##### TEST SMTP:  
In gitlab container execute:
```shell
gitlab-rails console
```
Wait when console is loaded
```rb
Notify.test_email('admin@nindeco.com', 'Message Subject', 'Message Body').deliver_now
```

---
### NextCloud LDAP configuration:
Tab Server:  
- url: ldap (we use dns docker. ldap <- this dns name container)   
- port: 389  
- DN: uid=cloud,ou=services,dc=nindeco,dc=com  
- Password: \<service_password\>  
- Base DN: dc=nindeco,dc=com
- Click Advanced and select Directory Settings
- Set 'member (AD)' in property Group-Member association

##### You need select settings in tabs to get such ldap filters:

Tab Users:
```ldif
(&(objectclass=person)(memberof=cn=users,ou=groups,dc=nindeco,dc=com))
```
Tab Credentials:
```ldif
(&(&(|(objectclass=person))(|(memberof=cn=users,ou=groups,dc=nindeco,dc=com)))(|(mail=%uid)(uid=%uid)))
```
Tab Groups:
```ldif
(&(|(objectclass=groupOfNames)(objectclass=mailGroup)(objectclass=posixGroup))(|(cn=admin)(cn=employee)(cn=manager)))
```
