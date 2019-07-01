andrewrothstein.sonarscannercli
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-sonarscannercli.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-sonarscannercli)

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
