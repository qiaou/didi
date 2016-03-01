package controllers

import (
	"github.com/astaxie/beego"
	"qs/models"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.tpl"
}

type SearchController struct {
	beego.Controller
}

func (this *SearchController) Get() {
	searchParam := models.SearchParam{this.GetString("driverMobile"),this.GetString("passMobile"),
		this.GetString("startTime"),this.GetString("endTime")}
	mystruct := doSearch(searchParam)
	this.Data["json"] =  &map[string][][]string{"data":mystruct}
	this.ServeJSON()
}


func doSearch(s models.SearchParam) [][]string  {
  return  [][]string{{"11","12","13","14","15"},
    {"21","22","23","24","25"},
    {"31","32","33","34","35"},
    {"41","42","43","44","45"},
    {"51","52","53","54","55"},
    {"61","62","63","64","65"},
    {"71","72","73","74","75"},
    {"81","82","83","84","85"},
		{"91","92","93","94","95"},
		{"101","82","83","84","85"},
		{"111","82","83","84","85"}};
}
