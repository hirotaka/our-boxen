# manifests/people/manifests/sonots.pp
class people::hirotaka {
  include chrome
  include virtualbox
  include dropbox
  include vagrant
  include hipchat
  include iterm2::stable
  include emacs
  include keyremap4macbook
  include sublime_text_2
  include sequel_pro
  #include evernote
  include skype
  include adobe_reader  
  include gimp  

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
