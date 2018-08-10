gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = {
'main' => {
  'label' => 'GitLab LDAP',
  'host' =>  'ldap',
  'port' => 389,
  'uid' => 'uid',
  'attributes' => {
    'username' => 'uid',
    'email' => ['mail','mailalias'],
    'first_name' => 'givenName',
    'last_name' => 'sn',
    'name' => 'cn'
  },
  'encryption' => 'plain',
  'allow_username_or_email_login' => 'false',
  'verify_certificates' => true,
  'bind_dn' => 'uid=git,ou=services,dc=nindeco,dc=com',
  'password' => 'defender',
  'active_directory' => true,
  'base' => 'OU=people,DC=nindeco,DC=com',
  'user_filter' => '(&(objectClass=posixAccount)(memberof=cn=users,ou=groups,dc=nindeco,dc=com))'
  }
}