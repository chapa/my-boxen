class people::chapa::applications::iterm (
	$version = '20140629'
) {
	
	package { 'iTerm':
		source   => "https://iterm2.com/downloads/beta/iTerm2-1_0_0_${version}.zip",
		provider => 'compressed_app',
	}

}
