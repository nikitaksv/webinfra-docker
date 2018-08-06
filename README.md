# nindeco
Redmine Ldap configuration:
    Name     = Some random description
    Host     = ldap.nindeco.com
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