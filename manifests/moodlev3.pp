include stdlib

file {'/home/vagrant/README':
    ensure => file,
    content => "General Purpose Machine\n",
    owner => 'vagrant',
    mode => '0444',
}

$packages = [
    'vim',
    'tree',
    'mlocate',
]


package {$packages:
    ensure => installed,
}

exec {"updatedb.mlocate":
  command => "/usr/bin/updatedb.mlocate",
  subscribe => Package["mlocate"]
}


file_line {'README_docker':
    ensure => present,
    path => '/home/vagrant/README',
    line => "Added Docker Support\n",
    require => File['/home/vagrant/README']
}

$docker_packages = [
    'docker',
    'docker-compose'
]


package {$docker_packages:
    ensure => installed,
}

service {'docker':
  ensure => running,
  enable => true
}


user {"vagrant":
    ensure => present,
    groups => "docker",
    require => Package['docker']
}


file {"/home/vagrant/Docker":
  ensure => "directory",
  replace => "no",
  source => "/vagrant/Docker",
  recurse => true

}

file_line {'README_moodlev3':
    ensure => present,
    path => '/home/vagrant/README',
    line => "Installed Moodle V3",
    require => File['/home/vagrant/README']
}

exec {"docker-compose up":
  command => "/usr/bin/docker-compose up -d",
  cwd => "/home/vagrant/Docker/MoodleV3",
  user => "vagrant",
  path =>["/usr/local/sbin",
          "/usr/local/bin",
          "/usr/sbin",
          "/usr/bin",
          "/sbin",
          "/bin"],
  require => [Service['docker'],
              Package['docker-compose'],
              File['/home/vagrant/Docker']]
}
