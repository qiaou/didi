package routers

import (
	"qs/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
		beego.Router("/search",&controllers.SearchController{})
}
