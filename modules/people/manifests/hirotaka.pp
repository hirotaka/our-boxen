# manifests/people/manifests/sonots.pp
class people::hirotaka {
  include zsh
  include chrome
  include iterm2::stable
  include virtualbox
  include dropbox
  include karabiner
  include vagrant
  include emacs
  include evernote
  include skype
  include adobe_reader
  include postgresql
  include heroku

  # homebrew でインストールするもの
  package {
    [
      'tmux',
      'rbenv-gemset'
    ]:
  }

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/Documents/workspace"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'hirotaka/dotfiles',
    require => File[$my]
  }
}
