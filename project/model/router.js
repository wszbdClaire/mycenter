const express = require("express");
let router = express.Router();
let dbl = require("./DBL");
const ejs = require("ejs");
const url = require("url");
const fs = require("fs");
const base64 = require("js-base64").Base64;
const multiparty=require("multiparty");

module.exports = (app) => {
    router.get("/", (req, res, next) => {
        let data = url.parse(req.url, true).query;
        dbl.findmenu(data.page ? data.page : 0, (result, user, randomblog, newblog, tetui, pageblog, updatenow, paihang, zhantui) => {
            //重复的数据全局存储
            app.locals['menu'] = result;
            app.locals['paihang'] = paihang;
            app.locals['zhantui'] = zhantui;
            app.locals['updatenow'] = updatenow;
            ejs.renderFile("view/index.html", {
                path: "/",
                menu: result,
                userinfo: user,
                randomblog: randomblog,
                newblog: newblog,
                tetui: tetui,
                pageblog: pageblog,
                updatenow: updatenow,
                clickpai: paihang,
                tui: zhantui
            }, (err, str) => {
                if (err) {
                    console.log(err);
                }
                res.send(str);
            });
        });
    });

    //个人博客
    router.get("/geren", (req, res, next) => {
        //获取全局数据
        let data = url.parse(req.url, true).query;
        dbl.findblog(data.page ? data.page : 0, 1, (geblog) => {
            ejs.renderFile("view/blog.html", {
                logo: "img/bg1.png",
                path: "/geren",
                menu: app.locals['menu'],
                clickpai: app.locals['paihang'],
                tui: app.locals['zhantui'],
                pageblog: geblog
            }, (err, str) => {
                if (err) {
                    console.log(err);
                }
                res.send(str);
            });
        });
    });
    //网站制作
    router.get("/wangzhan", (req, res, next) => {
        //获取全局数据
        let data = url.parse(req.url, true).query;
        dbl.findmoreblog(data.page ? data.page : 0, (geblog) => {
            ejs.renderFile("view/blog.html", {
                logo: "img/bg2.jpg",
                path: "/wangzhan",
                menu: app.locals['menu'],
                clickpai: app.locals['paihang'],
                tui: app.locals['zhantui'],
                pageblog: geblog
            }, (err, str) => {
                if (err) {
                    console.log(err);
                }
                res.send(str);
            });
        });
    });
    //网站建设
    router.get("/jianshe", (req, res, next) => {
        //获取全局数据
        let data = url.parse(req.url, true).query;
        dbl.findblog(data.page ? data.page : 0, 3, (geblog) => {
            ejs.renderFile("view/blog.html", {
                logo: "img/bg3.png",
                path: "/jianshe",
                menu: app.locals['menu'],
                clickpai: app.locals['paihang'],
                tui: app.locals['zhantui'],
                pageblog: geblog
            }, (err, str) => {
                if (err) {
                    console.log(err);
                }
                res.send(str);
            });
        });
    });
    //推荐工具/gongju
    router.get("/gongju", (req, res, next) => {
        //获取全局数据
        let data = url.parse(req.url, true).query;
        dbl.findblog(data.page ? data.page : 0, 4, (geblog) => {
            ejs.renderFile("view/blog.html", {
                logo: "img/bg4.png",
                path: "/gongju",
                menu: app.locals['menu'],
                clickpai: app.locals['paihang'],
                tui: app.locals['zhantui'],
                pageblog: geblog
            }, (err, str) => {
                if (err) {
                    console.log(err);
                }
                res.send(str);
            });
        });
    });

    //设计心得/sheji
    router.get("/sheji", (req, res, next) => {
        //获取全局数据
        let data = url.parse(req.url, true).query;
        dbl.findblog(data.page ? data.page : 0, 5, (geblog) => {
            ejs.renderFile("view/blog.html", {
                logo: "img/bg5.png",
                path: "/sheji",
                menu: app.locals['menu'],
                clickpai: app.locals['paihang'],
                tui: app.locals['zhantui'],
                pageblog: geblog
            }, (err, str) => {
                if (err) {
                    console.log(err);
                }
                res.send(str);
            });
        });
    });
    //关于我的路由/about
    router.get("/about", (req, res, next) => {
        //获取全局数据
        dbl.finduser((user) => {
            ejs.renderFile("view/about.html", {
                user: user,
                menu: app.locals['menu'],
                updatenow: app.locals['updatenow'],
            }, (err, str) => {
                if (err) {
                    console.log(err);
                }
                res.send(str);
            });
        });
    });

    //时间轴的路由/time
    router.get("/time", (req, res, next) => {
        let data = url.parse(req.url, true).query;
        dbl.getblogTimes(data.page ? data.page : 0, 10, (data) => {
            ejs.renderFile("view/blogtime.html", {
                menu: app.locals['menu'],
                pageData: data
            }, (err, str) => {
                res.send(str);
            });
        });
    });

    //博客详细 路由/detail
    router.get("/detail", (req, res, next) => {
        let path = url.parse(req.url, true).query;
        let id = path.id;
        let give = path.give;
        dbl.getdetail(id, give, app.locals['zan'], (blog) => {
            //全局存储赞
            app.locals['zan'] = blog[0].zan;
            ejs.renderFile("view/blogdetail.html", {
                menu: app.locals['menu'],
                blog: blog,
                clickpai: app.locals['paihang'],
                tui: app.locals['zhantui'],
                updatenow: app.locals['updatenow']
            }, (err, str) => {
                res.send(str);
            });
        });
    });
    //ajax  http://localhost:8100/givezan
    // router.post("/givezan",()=>{

    // })
    //留言界面 /liu
    router.get("/liu", (req, res, next) => {
        dbl.findmsg((result) => {
            ejs.renderFile("view/blogmsg.html", {
                menu: app.locals['menu'],
                findMsg: result.msg ? result.msg : [],
                backmsg: result.sendmsg
            }, (err, str) => {
                res.send(str);
            });
        });
    });
    //留言的表单提交
    router.post("/sendmsg", (req, res, next) => {
        let data = {
            name: req.body.nick,
            face: req.body.face,
            content: req.body.content,
            status: 0,//未读 0  已读  1
            times: new Date().toLocaleString()
        };
        dbl.insertMsg(data, (exec) => {
            ejs.renderFile("view/blogmsg.html", {
                menu: app.locals['menu'],
                findMsg: exec.msg
            }, (err, str) => {
                res.send(str);
            });
        });
    });

    //相关搜索路由 /likeblog
    //搜索表单提交 /likeblog
    //link
    router.post("/likeblog", (req, res, next) => {
        let link = req.body.link;
        dbl.mohufind(link, (result) => {
            ejs.renderFile("view/likeblog.html", {
                menu: app.locals['menu'],
                clickpai: app.locals['paihang'],
                pageblog: result,
                path: "/likeblog"
            }, (err, str) => {
                res.send(str);
            });
        });
    });

    router.get("/dao", (req, res, next) => {
        //路由页面丢失
        try {
            ejs.renderFile("view/blogdao.html", (err, str) => {
                if (err) {
                    throw err;
                }
                else {
                    res.send(str);
                }
            });
        }
        catch (e) {
            fs.appendFile("static/error.txt", e.message + "\n", (err) => {
                if (err) {
                    throw err;
                }
            });
            ejs.renderFile("view/404.html", (err, str) => {
                res.send(str);
            });
        }

        // next(new Error("网页丢失！"));
    });




    //后台管理路由
    router.get("/admin", (req, res, next) => {
        //读取缓存
        let cookie = req.signedCookies['user'];
        let user = null;
        if (cookie) {
            user = JSON.parse(base64.decode(cookie));
        }

        //读取页面的状态
        let stat=app.locals['status'];
        ejs.renderFile("view/admin/index.html", {
            user: user,
            stat:stat
        }, (err, str) => {
            app.locals['status']=false;
            res.send(str);
        });
    });
    //admin  post 登录
    router.post("/dologin", (req, res, next) => {
        let query = req.body;
        let user = {
            id: query.userid,
            pwd: query.userpwd,
            save: query.save == "on" ? 'checked' : ''
        };
        let save = query.save;
        dbl.login(user, (que) => {
            if (que.userdata[0].count == 1) {
                //查找用户的所有信息
                app.locals['userdata']=que.user[0];
                res.redirect("/adminindex");
            }
            else {
                //登录失败  重新回到当前登录界面
                app.locals['status']=true;
                res.redirect("/admin");
            }
        });
        if (save == "on") {
            //是否写入缓存 cookie
            res.cookie("user", base64.encode(JSON.stringify(user)), {
                maxAge: 60 * 1000 * 5,
                signed: true
            });
        }
    });

    router.get("/adminindex",(req,res,next)=>{
        ejs.renderFile("view/admin/admin.html",{
            user: app.locals['userdata']
        },(err, str) => {
            res.send(str);
        });
    });
    //发表博客的路由
    router.post("/upload",(req,res,next)=>{
        let form=new multiparty.Form();
        //设置图片的上传路径
        form.uploadDir="static/centerblogimage";
        form.parse(req,(err,fields,files)=>{
            let data={
                title:fields.title[0],
                jianjie:fields.miaoshu[0],
                content:fields.bloghtml[0],
                time:new Date().toLocaleString(),
                img:files.file[0].path.replace("static","").replace(/\\/g,'/'),
                type:parseInt(fields.type[0]),
                tui:0,
                click:0,
                zan:0
            }
            dbl.insertblog(data,(result)=>{
                res.redirect("/adminindex");
            });
        });

    });

    return router;
};