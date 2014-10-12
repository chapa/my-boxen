class people::chapa::applications {
	
	$homebrew_packages = [
		'wget',
	]

	package { $homebrew_packages:
		ensure => installed,
	}

	include [
		"${name}::iterm",
	]

}
