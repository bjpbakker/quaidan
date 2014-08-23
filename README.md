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

Development Guide
-----------------

Please write a test for every change you make. Run all tests

    python setup.py test

in order to ensure that you didn't break an existing feature.
