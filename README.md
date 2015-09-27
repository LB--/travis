travis
======
[Travis CI](https://travis-ci.org/) is great and all, but it has horribly outdated software for C and C++.
It can be a huge pain to try and figure out how to manually update or install the necessary software.
This repository is meant to put an end to that:
we've done most of the hard work for you, and you can just copypaste thanks to the public domain license.
If you can, try to help out by keeping this repo up to date with pull requests.

Currently, the following things are handled properly:
* GCC 5.1 is installed and the `$CC` and `$CXX` environment variables are updated accordingly
* biicode is installed without `sudo` and is added to `$PATH`
* CMake 3.3 (or later) is built from source or cached by Travis and we add it to `$PATH`

It would be nice if these things could be fixed:
* Travis uses the horribly outdated clang 3.4, it would be great to have clang 3.7 or later
* It would be amazing if Travis would just _update all the things_ for us, so that we don't have to muck around doing it ourselves

[Travis is set to build pull requests, so you can start a PR and muck around with it.](https://travis-ci.org/LB--/travis/pull_requests)

#**GLHF**
