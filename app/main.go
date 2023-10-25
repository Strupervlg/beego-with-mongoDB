package main

import (
	_ "app/routers"
	beego "github.com/beego/beego/v2/server/web"
)

var test string = "test"

func main() {
	beego.Run()
}
