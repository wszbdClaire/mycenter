const express=require("express");
const ejs=require("ejs");
const bodyParser=require("body-parser");
const cookieParser =require("cookie-parser");
let app=express();
app.use(cookieParser("abcdefg"));
let router=require("./model/router")(app);
app.use(express.static("static"));
app.set("view engine","ejs");
app.engine("html",ejs.renderFile);
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(router);
app.use((err, req, res, next) => {
    if(err.stack)
    {
        ejs.renderFile("view/404.html",(err,str)=>{
            res.send(str);
        });
    }
});
app.listen(8100,()=>{
    console.log("127.0.0.1:8100");
});