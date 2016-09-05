package main
import (
	"fmt"
	"os/exec"
	"io/ioutil"
)
func main() {
i:=5
if i<0 {
return
}
filename:=fmt.Sprintf("Sully_%d.go", i)
binary:=fmt.Sprintf("./Sully_%d", i)
i--
cmd := exec.Command("go", "build", "-o", binary, filename)
s:=`package main
import (
	"fmt"
	"os/exec"
	"io/ioutil"
)
func main() {
i:=%d
if i<0 {
return
}
filename:=fmt.Sprintf("Sully_%cd.go", i)
binary:=fmt.Sprintf("./Sully_%cd", i)
i--
cmd := exec.Command("go", "build", "-o", binary, filename)
s:=%c%s%c
str:=fmt.Sprintf(s, i, 37, 37, 96, s, 96)
ioutil.WriteFile(filename, []byte(str), 0644)
err := cmd.Run()
if err != nil {
	fmt.Println(err)
}
cmd = exec.Command(binary)
err = cmd.Run()
if err != nil {
	fmt.Println(err)
}
}
`
str:=fmt.Sprintf(s, i, 37, 37, 96, s, 96)
ioutil.WriteFile(filename, []byte(str), 0644)
err := cmd.Run()
if err != nil {
	fmt.Println(err)
}
cmd = exec.Command(binary)
err = cmd.Run()
if err != nil {
	fmt.Println(err)
}
}
