package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "asd12345"
	c.Data["Email"] = "astaxie@gmail.com"
	c.Data["Test"] = "asd123"
	c.TplName = "index.tpl"
}
