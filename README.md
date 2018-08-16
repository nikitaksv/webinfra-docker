# karioka
---
### Redmine Ldap configuration:

    Name     = Some random description
    Host     = ldap.karioka.ru
    Port     = 389
    LDAPS    = no
    Account  = cn=redmine,ou=services,dc=karioka,dc=ru
    Password = defender
    Base DN  = ou=people,dc=karioka,dc=ru  
    Filter   = (&(objectClass=posixAccount)(memberof=cn=users,ou=groups,dc=karioka,dc=ru))

    On-the-fly user creation = yes
    Attributes:
    Login     = uid
    Firstname = givenName
    Lastname  = sn
    Email     = mail

---
### Gitlab SMTP documentation: 
https://docs.gitlab.ru/omnibus/settings/smtp.html

##### TEST SMTP:  
In gitlab container execute:
```shell
gitlab-rails console
```
Wait when console is loaded
```rb
Notify.test_email('admin@karioka.ru', 'Message Subject', 'Message Body').deliver_now
```

---
### NextCloud LDAP configuration:
Tab Server:  
- url: ldap (we use dns docker. ldap <- this dns name container)   
- port: 389  
- DN: uid=cloud,ou=services,dc=karioka,dc=ru  
- Password: \<service_password\>  
- Base DN: dc=karioka,dc=ru
- Click Advanced and select Directory Settings
- Set 'member (AD)' in property Group-Member association

##### You need select settings in tabs to get such ldap filters:

Tab Users:
```ldif
(&(|(objectclass=person))(|(memberof=cn=users,ou=groups,dc=karioka,dc=ru)))
```
Tab Credentials:
```ldif
(&(&(|(objectclass=person))(|(memberof=cn=users,ou=groups,dc=karioka,dc=ru)))(|(mail=%uid)(uid=%uid)))
```
Tab Groups:
```ldif
(&(|(objectclass=groupOfNames)(objectclass=mailGroup)(objectclass=posixGroup))(|(cn=admin)(cn=employee)(cn=manager)))
```