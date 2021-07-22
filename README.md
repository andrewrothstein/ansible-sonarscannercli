andrewrothstein.sonarscannercli
=========
![Build Status](https://github.com/andrewrothstein/ansible-sonarscannercli/actions/workflows/build.yml/badge.svg)

Installs the [Sonar Scanner CLI](https://github.com/SonarSource/sonar-scanner-cli)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.sonarscannercli
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
