class people::chapa::osx {
	
	# OS X configuration

	include [
		'osx::global::enable_keyboard_control_access',
		'osx::global::expand_save_dialog',
		'osx::global::tap_to_click',

		'osx::dock::autohide',

		'osx::finder::show_external_hard_drives_on_desktop',
		'osx::finder::show_mounted_servers_on_desktop',
		'osx::finder::show_removable_media_on_desktop',
		'osx::finder::enable_quicklook_text_selection',

		'osx::universal_access::ctrl_mod_zoom',

		'osx::no_network_dsstores',
		'osx::software_update',
	]

	class { 'osx::dock::position':
		position => 'bottom'
	}

	class { 'osx::dock::hot_corners':
		top_left     => 'Mission Control',
		top_right    => 'Launchpad',
		bottom_left  => 'Desktop',
		bottom_right => 'Notification Center'
	}

	boxen::osx_defaults { 'Disable Gatekeeper':
		user   => $::boxen_user,
		domain => '/var/db/SystemPolicy-prefs.plist',
		key    => 'enabled',
		value  => 'no',
	}

}
