 class myfile$n {
    if $kernel == "Linux" {
      file { '/tmp/myfile$n':
        ensure  => file,
        backup  => false,
        content => "Hello myfile$n",
      }
    }
 }