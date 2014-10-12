require boxen::environment
require homebrew

Exec {
	group       => 'staff',
	logoutput   => on_failure,
	user        => $boxen_user,

	path => [
		'/usr/bin',
		'/bin',
		'/usr/sbin',
		'/sbin',
	],

	environment => [
		"HOMEBREW_CACHE=${homebrew::config::cachedir}",
		"HOME=/Users/${::boxen_user}",
	],
}

File {
	group => 'staff',
	owner => $boxen_user,
}

Package {
	provider => homebrew,
	require  => Class['homebrew'],
}

Repository {
	provider => git,
}

Service {
	provider => ghlaunchd,
}

Homebrew::Formula <| |> -> Package <| |>

node default {
	# core modules, needed for most things
	include dnsmasq
	include git
	include hub
	include nginx

	# fail if FDE is not enabled
	if $::root_encrypted == 'no' {
		fail('Please enable full disk encryption and try again')
	}

	file { "${boxen::config::srcdir}/my-boxen":
		ensure => link,
		target => $boxen::config::repodir,
	}
}
