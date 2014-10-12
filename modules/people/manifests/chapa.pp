class people::chapa {

	include [
		"${name}::applications",
		"${name}::dotfiles",
		"${name}::osx",
	]
}
