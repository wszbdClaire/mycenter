let mysql = require("./Mysql");
exports.findmenu = (now, callback) => {
    async function getdata() {
        let firstmenu = await new Promise((resolve, reject) => {
            mysql.findtable("select * from onemenu", (res) => {
                resolve(res);
            });
        }).catch((err) => {
            console.log(err);
        });
        let twomenu = await new Promise((resolve, reject) => {
            mysql.findtable("select * from twomenu", (res) => {
                resolve(res);
            });
        }).catch((err) => {
            console.log(err);
        });
        let userinfo = await new Promise((resolve, reject) => {
            mysql.findtable("select * from user", (res) => {
                resolve(res);
            });
        });
        //博客列表
        let bloglist = await new Promise((resolve, reject) => {
            mysql.findtable("select blog.id,title,jianjie,content,time,img,blogType.type from blog,blogType where blog.type=blogType.id order by blog.id desc", (res) => {
                resolve(res);
            });
        });
        //特别推荐
        let tetui = await new Promise((resolve, reject) => {
            mysql.findtable("select * from (select blog.id,title,jianjie,content,time,img,blogType.type from blog,blogType where blog.type=blogType.id and tui=1 order by blog.id desc) as list limit 6", (res) => {
                resolve(res);
            });
        });
        //获取数据分页
        let blogpage = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from (select blog.id,title,jianjie,content,time,img,blogType.type,user.face from blog,blogType,user where blog.type=blogType.id  order by blog.id desc) as list limit ${(now) * 5},5`, (res) => {
                resolve(res);
            });
        });
        //最近更新
        let blognowupdate = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from (select blog.id,title,jianjie,content,time,img,blogType.type,user.face from blog,blogType,user where blog.type=blogType.id order by blog.id desc) as list limit 4`, (res) => {
                resolve(res);
            });
        });
        //点击量排行
        let clickpai = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from (select blog.id,title,jianjie,content,time,img,blogType.type,user.face from blog,blogType,user where blog.type=blogType.id order by blog.clicknum desc) as list limit 8`, (res) => {
                resolve(res);
            });
        });
        //推荐
        let zhantui = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from (select blog.id,title,jianjie,content,time,img,blogType.type,user.face from blog,blogType,user where blog.type=blogType.id and tui=1 order by blog.clicknum desc) as list limit 8`, (res) => {
                resolve(res);
            });
        });

        return {
            firstmenu: firstmenu,
            twomenu: twomenu,
            userinfo: userinfo,
            bloglist: bloglist,
            tetui: tetui,
            blogpage: blogpage,
            blognowupdate: blognowupdate,
            clickpai: clickpai,
            zhantui: zhantui
        }
    }

    getdata().then((res) => {
        let menu = [];
        menu['result'] = res.firstmenu;
        res.firstmenu.map((val, index) => {
            val['child'] = [];
            let child = [];
            res.twomenu.map((v, i) => {
                if (val.id == v.foreignid) {
                    child.push(v);
                    menu['result'][index]['child'] = child;
                }
            });
        });
        //随机两条博客
        let blog = [];
        do {
            let index = Math.floor(Math.random() * res.bloglist.length);
            if (blog.length == 0) {
                blog.push(res.bloglist[index]);
            }
            else if (blog[0].id != res.bloglist[index].id) {
                blog.push(res.bloglist[index]);
            }
        } while (blog.length <= 1);

        //前7个博客
        let newblog = res.bloglist.slice(0, 7);
        //特别推荐
        //数据分页
        //最近更新
        //点击排行
        callback(menu, res.userinfo, blog, newblog, res.tetui, res.blogpage, res.blognowupdate, res.clickpai, res.zhantui);
    })
}
exports.findblog = (now, type, callback) => {
    let getdata = async () => {
        //找个人博客  按照点击排行
        let peopleblog = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from (select blog.id,title,jianjie,content,time,img,blogType.type,user.face from blog,blogType,user where blog.type=blogType.id and blogType.id=${type} order by blog.clicknum desc) as list limit ${now * 5},5`, (res) => {
                resolve(res);
            });
        });
        return {
            peopleblog: peopleblog
        }
    }
    getdata().then((res) => {
        callback(res.peopleblog);
    });
}
//查找所有的博客
exports.findmoreblog = (now, callback) => {
    let getdata = async () => {
        //找个人博客  按照点击排行
        let peopleblog = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from (select blog.id,title,jianjie,content,time,img,blogType.type,user.face from blog,blogType,user where blog.type=blogType.id order by blog.clicknum desc) as list limit ${now * 5},5`, (res) => {
                resolve(res);
            });
        });
        return {
            peopleblog: peopleblog
        }
    }
    getdata().then((res) => {
        callback(res.peopleblog);
    });
}
//获取用户的所有信息
exports.finduser = (callback) => {
    let getdata = async () => {
        //找个人博客  按照点击排行
        let info = await new Promise((resolve, reject) => {
            mysql.findtable("select * from user", (res) => {
                resolve(res);
            });
        });
        return {
            info: info
        }
    }
    getdata().then((res) => {
        callback(res.info);
    });
}

//查找所有的博客  按照时间降序排
exports.getblogTimes = (now, number, callback) => {
    let getdata = async () => {
        let blog = await new Promise((resolve, reject) => {
            mysql.findtable(`select blog.id,title,time from blog  order by blog.time desc limit ${now * number},${number}`, (res) => {
                resolve(res);
            });
        });
        return blog;
    }
    getdata().then((res) => {
        callback(res);
    });
}
//根据id 查找当前博客相关信息
exports.getdetail = (id, give, beforezan, callback) => {
    let data = async () => {
        if (give) {
            let zan = await new Promise((resolve, reject) => {
                beforezan += 1;
                mysql.findtable(`update blog set zan=${beforezan} where id=${id}`, (res) => {
                    resolve(res);
                })
            });
        }
        let blog = await new Promise((resolve, reject) => {
            mysql.findtable(`select blog.id,title,jianjie,clicknum,tui,zan,content,time,img,blogType.type,user.face from blog,blogType,user where blog.type=blogType.id and blog.id=${id}`, (res) => {
                resolve(res);
            })
        });
        return {
            blog: blog
        }
    }
    data().then((res) => {
        callback(res.blog);
    });
}
//增加留言
exports.insertMsg = (data, callback) => {
    let datalist = async () => {
        let one = await new Promise((resolve, reject) => {
            let sql = `insert into msg values(null,'${data.name}','${data.face}','${data.content}','${data.times}',${data.status})`;
            console.log(sql);
            mysql.findtable(sql, (res) => {
                resolve(res);
            })
        });
        let findmsg = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from msg`, (res) => {
                resolve(res);
            })
        });
        return {
            one: one,
            msg: findmsg
        };
    }
    datalist().then((res) => {
        callback(res);
    });
}
exports.findmsg = (callback) => {
    let datalist = async () => {
        let findmsg = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from msg order by times desc`, (res) => {
                resolve(res);
            })
        });
        let sendmsg = await new Promise((resolve, reject) => {
            mysql.findtable(`select * from send`, (res) => {
                resolve(res);
            })
        });
        return {
            msg: findmsg,
            sendmsg: sendmsg
        };
    }
    datalist().then((res) => {
        callback(res);
    });
}
//模糊查找博客
exports.mohufind = (data, callback) => {
    let sql = `select blog.id,title,jianjie,clicknum,tui,zan,content,time,img,blogType.type,user.face from blog,user,blogType where blog.type=blogType.id and title like '%${data}%'`;
    mysql.findtable(sql, (res) => {
        callback(res);
    })
}
//用户登录
exports.login = (data, callback) => {
    let userdata = async () => {
        let userinfo = await new Promise((resolve, reject) => {
            let sql = `select count(*) as count from user where userid='${data.id}' and userpwd='${data.pwd}'`;
            mysql.findtable(sql, (res) => {
                resolve(res);
            })
        });
        let user = null;
        if (userinfo[0].count == 1) {
            //登录成功  查用户信息
            user = await new Promise((resolve, reject) => {
                let sql = `select * from user where userid='${data.id}' and userpwd='${data.pwd}'`;
                mysql.findtable(sql, (res) => {
                    resolve(res);
                })
            });
        }
        return {
            userdata: userinfo,
            user:user
        }
    }
    userdata().then((res) => {
        callback(res);
    });
}
//增加博客
exports.insertblog=(data,callback)=>{
    let sql = `insert into blog values (null,'${data.title}','${data.jianjie}','${data.content}','${data.time}','${data.img}',${data.type},0,0,0)`;
    console.log(sql);
    mysql.findtable(sql, (res) => {
        callback(res);
    })
}