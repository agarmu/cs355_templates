#let thm-has-qedhere(x) = {
  if x == "thm-qedhere" {
    return true
  }

  if type(x) == content {
    for (f, c) in x.fields() {
      if thm-has-qedhere(c) {
        return true
      }
    }
  }

  if type(x) == array {
    for c in x {
      if thm-has-qedhere(c) {
        return true
      }
    }
  }

  return false
}


#let qedhere = metadata("thm-qedhere") 


