name              "couchdb"
maintainer        "Roundscope"
maintainer_email  "a.obozinsky@roundscope.com"
license           "Apache 2.0"
description       "Installs CouchDB package, starts service, and create symlinks"
long_description  <<-EOH
Installs the CouchDB package if it is available from an package repository on
the node. If the package repository is not available, CouchDB needs to be
installed via some other method, either a backported package, or compiled
directly from source. CouchDB is available on Red Hat-based systems through
the EPEL Yum Repository.
EOH
version           "2.4.5"
depends           "erlang"
depends           "yum"
recipe            "couchdb", "Installs and configures CouchDB package"
recipe            "couchdb::source", "Installs and configures CouchDB from source"

supports          "ubuntu", ">= 8.10" # for package in APT
supports          "debian", ">= 5.0" # for package in APT
supports          "openbsd"
supports          "freebsd"

%w{ redhat centos fedora scientific oracle amazon }.each do |os|
  supports os # requires EPEL Yum Repository
end
