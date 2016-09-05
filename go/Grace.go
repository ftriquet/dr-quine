package main
import "io/ioutil"
import "fmt"
func main() {
str:=`package main
import "io/ioutil"
import "fmt"
func main() {
str:=%c%s%c
s:=fmt.Sprintf(str,96,str,96)
ioutil.WriteFile("Grace_kid.go",[]byte(s),0644)
}
`
s:=fmt.Sprintf(str,96,str,96)
ioutil.WriteFile("Grace_kid.go",[]byte(s),0644)
}
