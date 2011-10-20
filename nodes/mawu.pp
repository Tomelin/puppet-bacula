node mawu {
  include role::base

  # DNS resolution to internal hosts
  class {
    "unbound":
      interface => ["::0","0.0.0.0"],
      access    => ["192.168.100.0/24","10.0.0.0/16"],
  }

  unbound::stub { "puppetlabs.lan":
    address  => '192.168.100.1',
    insecure => true,
  }

  unbound::stub { "100.168.192.in-addr.arpa.":
    address  => '192.168.100.1',
    insecure => true,
  }

}
