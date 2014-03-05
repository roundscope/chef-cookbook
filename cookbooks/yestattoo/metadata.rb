name             'yestattoo'
maintainer       'Roundscope'
maintainer_email 'a.obozinsky@roundscope.com'
license          'All rights reserved'
description      'Installs/Configures yestattoo env'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends	  "apt"
depends	  "nginx"
depends	  "rvm"
depends	  "mysqld"
depends	  "roundscope"