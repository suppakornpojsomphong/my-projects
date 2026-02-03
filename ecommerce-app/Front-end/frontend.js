const PORT = 3300;
const express = require("express");
const path = require("path");
const app = express();
const router = express.Router();
router.use(express.json());
const url = require("url");
router.use(express.urlencoded({ extended: true}));

const cors = require("cors");
/* This is for specific origin and method */
let corsOptions = {
    origin: 'http://localhost:8000',
    methods: 'GET,POST,PUT,DELETE'
}
router.use(cors(corsOptions));
// router.use(cors());

app.use("/", router);
app.use("/Pictures", express.static(path.join(__dirname, "Pictures")));
app.use("/css", express.static("css"));
app.use("/js", express.static(path.join(__dirname, "js")));


/* START OF homepage */
router.get("/web-page", (req, res) => {
    console.log("--Connected to Webpage")
    res.sendFile(path.join(__dirname + "/html/Web_page.html"));
})
/* END OF homepage */

/* START OF sign-in */
router.get("/signin-page", (req, res) => {
    console.log("--Connected to Signin Page")
    res.sendFile(path.join(__dirname + "/html/sign_in_page.html"));
})
/* END OF sign-in */

router.get("/task-bar", (req, res) => {
    res.statusCode = 200;
    console.log("Connected to Task bar page");
    // res.redirect("http://localhost:3300/task-bar");
    res.sendFile(path.join(__dirname, 'html', "task_bar.html"));
})

/* START OF team-page */
router.get("/team-page", (req, res) => {
    console.log("--Connected to Team Page")
    res.sendFile(path.join(__dirname + "/html/team_page.html"));
})
/* END OF team-page */

/* START OF search-page */
router.get("/search-page", (req, res) => {
    console.log("--Connected to Search Page")
    res.sendFile(path.join(__dirname + "/html/search.html"));
})
/* END OF search-page */

router.get("/product", (req, res) => {
    res.statusCode = 200;
    console.log("Connected to Product Page")
    // res.status(200).set("Content-Type", "text/html");
    res.sendFile(path.join(__dirname + "/html/Product.html"));
})
router.get("/product-detail", (req, res) => {
    res.statusCode = 200;
    console.log("Connected to Product detail page");
    res.sendFile(path.join(__dirname + "/html/product_detail.html"));
})

router.get("/task-bar", (req, res) => {
    res.statusCode = 200;
    console.log("Connected to Task bar page");
    res.sendFile(path.join(__dirname + "/html/task_bar.html"));
})

router.get("/admin", (req, res) => {
    res.statusCode = 200;
    console.log("Connected to admin")
    // res.status(200).set("Content-Type", "text/html");
    res.sendFile(path.join(__dirname, 'html', "admin.html"));
})

/* START OF admin-manage-page */
router.get("/admin-manage-page", (req, res) => {
    console.log("--Connected to Admin management Page")
    res.sendFile(path.join(__dirname + "/html/admin_management.html"));
});
/* END OF admin-manage-page */


/* PRODUCT MANAGE */

/* START OF product-manage-page */
router.get("/product-management", (req, res) => {
    console.log("--Connected to Product management Page")
    res.sendFile(path.join(__dirname + "/html/product_management.html"));
});
/* END OF product-manage-page */

router.get("/add_product", (req, res) => {
    res.statusCode = 200;
    console.log("Connected to add product")
    // res.status(200).set("Content-Type", "text/html");
    res.sendFile(path.join(__dirname, 'html', "add_product.html"));
})

/* START OF edit-product-manage-page */
router.get("/edit_product", (req, res) => {
    console.log("--Connected to Product management Page")
    res.sendFile(path.join(__dirname + "/html/edit_product.html"));
});
/* END OF edit-product-manage-page */

/* RUN SERVER */
app.listen(PORT, () => {
    console.log(`Server listening on port: ${PORT}`);
})