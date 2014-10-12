define people::chapa::dotfile ($repo, $home) {

	file { "${home}/.${name}":
		ensure  => link,
		mode    => '0644',
		target  => "${repo}/${name}",
		require => Repository[$repo],
	}

}

class people::chapa::dotfiles {

	$repo = "${boxen::config::srcdir}/dotfiles"
	$home = "/Users/${::boxen_user}"

	repository { $repo:
		source => "${::github_login}/dotfiles",
	}

	$dotfiles = [
		'profile',
		'bashrc',
		'bash_aliases',
	]

	people::chapa::dotfile { $dotfiles:
		repo => $repo,
		home => $home,
	}

}
