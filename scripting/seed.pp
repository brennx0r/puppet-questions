 class myfile$i {
    if $kernel == "Linux" {
      file { '/tmp/myfile$i':
        ensure  => file,
        backup  => false,
        content => "Hello myfile$i",
      }
    }
 }