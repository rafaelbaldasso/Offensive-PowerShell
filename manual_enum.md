#### DOMAIN GROUPS
```
net group /domain
net group "Domain Admins" /domain
# PTBR: Admins. do domínio
net group "Enterprise Admins" /domain
```

#### DOMAIN USERS
```
qwinsta /server:<HOSTNAME>
net user /domain
# or: net accounts /domain
```

SHARES
```
net view \\<HOST> /all
```

LOCAL ENUMERATION
```
hostname
net user
whoami /priv
net localgroup
net localgroup "Administrators"
# PTBR: Administradores
gpresult /z
```
