# Install Sublime Text 2 into /Applications
#
# Usage:
#
#     include sublime_text_2
class sublime_text_2 {
  package { 'SublimeText2':
    provider => 'appdmg',
    source   => 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg';
  }

  file { "${boxen::config::bindir}/subl":
    ensure  => link,
    target  => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
    mode    => '0755',
    require => Package['SublimeText2'],
  }

  file { "/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    content => template('sublime_text_2/Preferences.sublime-settings.erb'),
    force   => true,
    group   => 'wheel',
    owner   => $::luser,
    require => Package['SublimeText2'],
  }

  file { "/Users/${::luser}/Library/Application Support/Sublime Text 2/Packages/User/Default (OSX).sublime-keymap":
    content => template('sublime_text_2/Default (OSX).sublime-keymap.erb'),
    force   => true,
    group   => 'wheel',
    owner   => $::luser,
    require => Package['SublimeText2'],
  }

}
