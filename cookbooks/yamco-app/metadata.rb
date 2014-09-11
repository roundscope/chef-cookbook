name             'yamco-app'
maintainer       'Roundscope'
maintainer_email 'hi@roundscope.com'
license          'All rights reserved'
description      'Installs/Configures yamco-app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends "apt"
depends "nginx"
depends "rvm"
depends "nodejs"
depends "build-essential"
depends "roundscope"
