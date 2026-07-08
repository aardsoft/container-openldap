#!/bin/bash
# Ensure ldap user exists with the IDs expected by the openldap2 package.
# The rpm %pre scriptlet should create this, but explicitly creating it here
# guarantees the user exists regardless of build environment quirks.
getent group ldap >/dev/null || /usr/sbin/groupadd -g 70 -o -r ldap
getent passwd ldap >/dev/null || /usr/sbin/useradd -r -o -g ldap -u 76 -s /bin/false -c "User for OpenLDAP" -d /var/lib/ldap ldap
