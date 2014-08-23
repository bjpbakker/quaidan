Quaidan
=======

[![Build Status](https://travis-ci.org/stefanbirkner/quaidan.svg?branch=master)](https://travis-ci.org/stefanbirkner/quaidan)

Quaidan is a python wrapper for
[mod_proxy_balancer](http://httpd.apache.org/docs/2.4/mod/mod_proxy_balancer.html)'s
balancer manager.

Quaidan currently has only one feature:

* Provide the current state of the load balancer.

Installation
------------

[Download Quaidan](https://github.com/stefanbirkner/quaidan/archive/master.zip)
and unpack it or clone the repository. Now run

    python setup.py install

which installs Quaidan in your Python installation.

Usage
-----

The starting point for all interactions is a `BalancerManager` object.
It is created by specifying the balancer manager's URL.

```python
from quaidan import BalancerManager

balancer_manager = BalancerManager('http://127.0.0.1/balancer-manager')
```

This `BalancerManager` can be used to read the current state of the load
balancer. The following snippet prints alle infos that are available
from the balancer manager page.

```python
status = balancer_manager.get_status()
print('clusters:')
for cluster in status.clusters:
    print('  -')
    print('    name: ' + cluster.name)
    print('    members:')
    for member in cluster.members:
        print('      -')
        print('        worker_url: "' + member.worker_url + '"')
        print('        route: "' + str(member.route) + '"')
        print('        route_redirect: "' + str(member.route_redirect) + '"')
        print('        load_factor: ' + str(member.load_factor))
        print('        lb_set: ' + str(member.lb_set))
        print('        ignore_errors: ' + str(member.ignore_errors))
        print('        draining_mode: ' + str(member.draining_mode))
        print('        enabled: ' + str(member.enabled))
        print('        hot_standby: ' + str(member.hot_standby))
        print('        elected: ' + str(member.elected))
        print('        busy: ' + str(member.busy))
        print('        load: ' + str(member.load))
        print('        transferred: ' + member.transferred)
        print('        read: ' + member.read)
```


Development Guide
-----------------

Please write a test for every change you make. Run all tests

    python setup.py test

in order to ensure that you didn't break an existing feature. Some of
the tests need a running Apache with a `mod_proxy_balancer`. The file
`setup_apache.sh` can be used to set up a well configured Apache
server if you're using Ubuntu Linux.

I strongly encourage you to use [Vagrant](http://www.vagrantup.com/).
Qaidan provides a `Vagrantfile` that sets up a virtual machine with
all prerequisites. You need three commands only to start the virtual
machine and execute Quaidan's test suite.

    vagrant up
    vagrant ssh
    python setup.py test
