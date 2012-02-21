class zfs::munin {

  include munin::params

  # install the files, then use them.
  file{ "${munin::params::plugin_source}/zfs":
    ensure  => directory,
    recurse => true,
    owner   => 'root',
    group   => 0, # wheel or root.
    mode    => '0755',
    source  => 'puppet:///modules/zfs/muninplugins/',
  }

	$plugins = [  'zfs-filesystem-graph',
                'zfs-statistics-for-freebsd',
                'zfs-stats-for-freebsd-arc-efficiency',
                'zfs-stats-for-freebsd-arc-utilization',
                'zfs-stats-for-freebsd-cache-hits-by-cache-list',
                'zfs-stats-for-freebsd-cache-hits-by-data-type',
                'zfs-stats-for-freebsd-dmu-prefetch',
                'zlist',
                'zpool_iostat' ]

  munin::pluginer{ $plugins: ,
    pluginpath => "${munin::params::plugin_source}/zfs",
    require    => File["${munin::params::plugin_source}/zfs"],
  }

}