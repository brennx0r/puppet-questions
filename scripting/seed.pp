 class myfile$NUMBER {
    if $kernel == "Linux" {
      file { '/tmp/myfile$NUMBER':
        ensure  => file,
        backup  => false,
        content => "Hello myfile$NUMBER",
      }
    }
 }