const express = require('express');
const path = require('path');
const app = express();
const router = express.Router();
app.use(router)
const dotenv = require("dotenv");
dotenv.config();
var bodyParser = require('body-parser')
router.use(express.json());
router.use(express.urlencoded({ extended: true }));


const mysql = require('mysql2');
let dbConn = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USERNAME,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
});

dbConn.connect(function (err) {
    if (err) throw err;
    console.log(`Connected DB: ${process.env.MYSQL_DATABASE}`);
});

/* path */
router.get('/sign-up', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Sign Up.html`))
})
router.get('/user-login', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/User_login.html`))
})
router.get('/admin-login', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Admin_login.html`))
})
router.get('/book', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Book_p2.html`))
})
/* get for insert del update */
router.get('/insertad', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Add_Admin.html`))
})

router.get('/deletead', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Del1_Admin.html`))
})

router.get('/updatead', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Update_Admin.html`))
})

router.get('/insertbo', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Add_Book.html`))
})

router.get('/deletebo', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Del_Book.html`))
})

router.get('/updatebo', (req, res) => {
    res.statusCode = 200;
    res.sendFile(path.join(`${__dirname}/Update_Book.html`))
})

// router.get('/bookinfo', (req, res) => {
//     res.statusCode = 200;
//     res.sendFile(path.join(`${__dirname}/Bookinfo.html`))
// })

/* get the data */

router.get('/admininfo', (req, res) => {
    res.statusCode = 200;
    dbConn.query("select * from admin_info;", function (error, results) {
        console.log(results)
        let htmlbase = `<!DOCTYPE html>
        <html>
        
        <head>
            <link rel="stylesheet" href="changefont.css" />
            <link rel="stylesheet" href="AdminInfo.css" />
            <title>Admin Information</title>
            <style>
                table { 
                    border-collapse: collapse;
                    font-size: 20px;
                }
        
                tr,
                th,
                td {
                    border: 4px solid #252b78;
                    text-align: center;
                    height: 39px;
                }
        
                .blankrow {
                    height: 100%;
                }
            </style>
        </head>
        
        <body style="font-family: 'Prompt Bold';" ng-controller="profileCtrl">
            <div style="margin-top: 2rem;">
                <div
                    style="float: left; display: flex; flex-direction: row; justify-content: space-evenly; margin-left: 40px; margin-top: 2.5rem; ">
                </div>
                <img src="images/logo.jpg" alt="MarsBook logo" style="height: 80px;">
            </div>
            <ul style="clear: both; float: right; margin-top: -4rem; margin-right: 50px;">
                <form action="">
                    <button type="submit"
                        style="border: 7px solid; padding: 8px 35px; border-radius: 100px; background-color: #191919; border-color: #191919; font-size: 15px; color: white; margin-right: 20px;"><b>SEARCH</b></button>
                    <input type="text" name="search" style="border: 4px solid; width: 600px; height: 35px; font-size: 20px;">
                </form>
            </ul>
            </div>
            <p style="clear: both; text-align: center; color: #252b78; font-size: 65px; margin-top: 3rem;">Admin Information</p>
            <table class="del_admin" id="lnwza" style="width:1125px; height: 312px; margin-top: -1.5rem; margin: auto;">
                <tr class="del_admin">
                    <th style="width: 50px;">No.</th>
                    <th style="width: 140px">Name</th>
                    <th style="width: 140px">Surname</th>
                    <th style="width: 135px">Phone Number</th>
                    <th style="width: 180px">Address</th>
                </tr>`;
        let htmlbasebot = `</table>
        
        
        
        <center>
            <nav style="margin-top: 50px;">
                <a href="Add_Admin.html"
                    style="clear: right; color: #191919; border: solid #c84b31; padding: 7px 35px;  border-radius: 32px; background-color: #c84b31; color: white; font-size: x-large; text-decoration: none;">Add</a>
                <a href="Del_Admin.html"
                    style="clear: right; color: #191919; border: solid #c84b31; padding: 7px 35px;  border-radius: 32px; background-color: #c84b31; color: white; font-size: x-large; text-decoration: none">Delete</a>
            </nav>
        </center>
    
    
    </body>
    <footer
        style="clear: both; left: 0; bottom: 0; width: 100%; height: 5rem; text-align: center; margin-top: 4rem; background-color: #15192b; color: white;">
        ติดต่อสอบถาม<br>
        LINE : @Mars.official | Tel: 022 - 058 - 999
    </footer>
    

    
    </html>`;
        let datarow = ''
        for (let i in results) {
            datarow +=
                `<tr>
            <td>${results[i][`AdminID`]}</td>
            <td>${results[i][`Name`]}</td>
            <td>${results[i][`Surname`]}</td>
            <td>${results[i][`Phone_Number`]}</td>
            <td>${results[i][`Address`]}</td>
        </tr>`
        }
        res.send(htmlbase + datarow + htmlbasebot)
    });


})

/* insert */
router.post('/insertad', (req, res) => {
    res.statusCode = 200;
    const adminID = req.body.AdminID
    const name = req.body.name
    const surname = req.body.Surname
    const phnum = req.body.PhoneNumber
    const addr = req.body.Address

    let datajs = {

        "AdminID": `${adminID}`,
        "Name": `${name}`,
        "Surname": `${surname}`,
        "Phone_Number": `${phnum}`,
        "Address": `${addr}`


    }
    dbConn.query("insert into admin_info SET ?", datajs, function (error, results) {
        let checker
        if (error) {
            checker = true
            throw error
        }
        else {
            res.redirect('/admininfo')
        }
    });


})



/* delete */
router.post('/deletead', (req, res) => {
    res.statusCode = 200;
    const adminID = req.body.AdminID

    dbConn.query("delete from Admin_info where AdminID = ?", [adminID], function (error, results) {
        let checker
        if (error) {
            checker = true
            throw error
        }
        else {
            res.redirect('/admininfo')
        }
    });


})

/* update */
router.post('/updatead', (req, res) => {
    res.statusCode = 200;
    const phnum = req.body.Oldph
    const phnew = req.body.Newph



    dbConn.query("update admin_info SET Phone_Number =? where Phone_Number=?", [phnew, phnum], function (error, results) {
        let checker
        if (error) {
            checker = true
            throw error
        }
        else {
            res.redirect('/admininfo')
        }
    });


})

/* FOR BOOKS */
router.get('/bookinfo', (req, res) => {
    res.statusCode = 200;
    dbConn.query("select * from book_info;", function (error, results) {
        console.log(results)
        let htmlbase = `<!DOCTYPE html>
        <html>
        
        <head>
            <link rel="stylesheet" href="changefont.css" />
            <link rel="stylesheet" href="AdminInfo.css" />
            <title>Book Information</title>
            <style>
                table {
                    border-collapse: collapse;
                    font-size: 20px;
                }
        
                tr,
                th,
                td {
                    border: 4px solid #252b78;
                    text-align: center;
                    height: 39px;
                }
        
                .blankrow {
                    height: 100%;
                }
            </style>
        </head>
        
        <body style="font-family: 'Prompt Bold';" ng-controller="profileCtrl">
            <div style="margin-top: 2rem;">
                <div
                    style="float: left; display: flex; flex-direction: row; justify-content: space-evenly; margin-left: 40px; margin-top: 2.5rem; ">
                </div>
                <img src="images/logo.jpg" alt="MarsBook logo" style="height: 80px;">
            </div>
            <ul style="clear: both; float: right; margin-top: -4rem; margin-right: 50px;">
                <form action="">
                    <button type="submit"
                        style="border: 7px solid; padding: 8px 35px; border-radius: 100px; background-color: #191919; border-color: #191919; font-size: 15px; color: white; margin-right: 20px;"><b>SEARCH</b></button>
                    <input type="text" name="search" style="border: 4px solid; width: 600px; height: 35px; font-size: 20px;">
                </form>
            </ul>
            </div>
            <p style="clear: both; text-align: center; color: #252b78; font-size: 65px; margin-top: 3rem;">Book Information</p>
            <table class="del_admin" id="lnwza" style="width:1125px; height: 312px; margin-top: -1.5rem; margin: auto;">
                <tr class="del_admin">
                    <th style="width: 50px;">No.</th>
                    <th style="width: 140px">Title</th>
                    <th style="width: 140px">Author</th>
                    <th style="width: 165px">Publisher</th>
                    <th style="width: 180px">Type</th>
                    <th style="width: 180px">Price</th>
                    <th style="width: 180px">Image</th>
                </tr>`;
        let htmlbasebot = `</table>
    
    
    </body>
    <footer
        style="clear: both; left: 0; bottom: 0; width: 100%; height: 5rem; text-align: center; margin-top: 4rem; background-color: #15192b; color: white;">
        ติดต่อสอบถาม<br>
        LINE : @Mars.official | Tel: 022 - 058 - 999
    </footer>
    

    
    </html>`;
        let datarow = ''
        for (let i in results) {
            datarow +=
                `<tr>
            <td>${results[i][`BookID`]}</td>
            <td>${results[i][`Title`]}</td>
            <td>${results[i][`Author`]}</td>
            <td>${results[i][`Publisher`]}</td>
            <td>${results[i][`Type`]}</td>
            <td>${results[i][`Price`]}</td>
            <td>${results[i][`Bookimg`]}</td>
        </tr>`
        }
        res.send(htmlbase + datarow + htmlbasebot)
    });


})

/* insert */
router.post('/insertbo', (req, res) => {
    res.statusCode = 200;
    const bookID = req.body.BookID
    const title = req.body.Title
    const author = req.body.Author
    const publ = req.body.Publisher
    const btype = req.body.Type
    const bprice = req.body.Price

    let datajs = {

        "BookID": `${bookID}`,
        "Title": `${title}`,
        "Author": `${author}`,
        "Publisher": `${publ}`,
        "Type": `${btype}`,
        "Price":`${bprice}`


    }
    dbConn.query("insert into book_info SET ?", datajs, function (error, results) {
        let checker
        if (error) {
            checker = true
            throw error
        }
        else {
            res.redirect('/bookinfo')
        }
    });


})



/* delete */
router.post('/deletebo', (req, res) => {
    res.statusCode = 200;
    const bookID = req.body.BookID
    dbConn.query("delete from book_info where BookID = ?", [bookID], function (error, results) {
        let checker
        if (error) {
            checker = true
            throw error
        }
        else {
            res.redirect('/bookinfo')
        }
    });


})

/* update */
router.post('/updatebo', (req, res) => {
    res.statusCode = 200;
    const boID = req.body.OldboID
    const ntitle = req.body.NewTitle
    const nauthor = req.body.NewAuth
    const npubl = req.body.NewPubl
    const nbtype = req.body.NewType
    const nbprice = req.body.NewPrice
    const nbimg = req.body.NewImg

    

    dbConn.query("update book_info SET  Title=?, Author=?,Publisher=?,Type=?,Price=?,Bookimg=? where BookID=?", [ntitle,nauthor,npubl,nbtype,nbprice,nbimg,boID], function (error, results) {
        let checker
        if (error) {
            checker = true
            throw error
        }
        else {
            res.redirect('/bookinfo')
        }
    });


})


app.listen(process.env.PORT, function () {
    console.log("Server listening at Port "
        + process.env.PORT);
});


