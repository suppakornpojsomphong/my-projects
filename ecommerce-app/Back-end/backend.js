const express = require("express");
const path = require("path");
const app = express();
const router = express.Router();
app.use("/", router); // Register the router
app.use(express.static(path.join(__dirname, 'Front-end')));
router.use(express.json());
router.use(express.urlencoded({ extended: true}));

const dotenv = require("dotenv");
dotenv.config();

const cors = require("cors");
/* This is for specific origin and method */
let corsOptions = {
    origin: 'http://localhost:3300',
    methods: 'GET,POST,PUT,DELETE'
}
router.use(cors(corsOptions));
// router.use(cors());

const session = require("express-session");
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

/* Connection to MySQL */
const mysql = require("mysql2");
var connection = mysql.createConnection({
    host    : process.env.MYSQL_HOST,
    user    : process.env.MYSQL_USERNAME,
    password    : process.env.MYSQL_PASSWORD,
    database    : process.env.MYSQL_DATABASE
});
/* END OF Connection to MySQL */

/* Connection to DB */
connection.connect(function(err){
    if(err) {
        throw err;
    }
    console.log(`Connected DB : ${process.env.MYSQL_DATABASE}`)
})


/* END OF Connection to DB */
router.get("/new-products", (req, res) => {
    connection.query('SELECT * FROM Product WHERE status = "new" LIMIT 5', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
});

router.get("/hot-products", (req, res) => {
    connection.query('SELECT * FROM Product WHERE status = "hot" LIMIT 10', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
});

router.get("/collection-product-left", (req, res) => {
    connection.query('SELECT * FROM Product WHERE prod_SKU = "195949048623"', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
})

router.get("/collection-product-right", (req, res) => {
    connection.query('SELECT * FROM Product WHERE prod_SKU IN ("1942533241572", "190198893369")', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
})

router.post("/form-post", (req, res) => {
    console.log(`${req.method}`);
    console.log(req.body);
    const username = req.body.username;
    const password = req.body.password;
    console.log(`Form submitted by ${username}`);

    let sql = `SELECT * FROM Login WHERE (login_email = '${username}') AND (login_password = '${password}')`;

    connection.query(sql, [username, password], function (error, results) {
        if (error) {
            res.status(500).send("Internal server error. Please try again."); // Internal server error
        } else {
            if (results.length > 0) {
                // Set cookie upon successful login
                res.redirect("http://localhost:3300/task-bar"); // Redirect to web page on successful login
                console.log("Signed In");
            } else {
                // Render HTML with pop-up message for invalid credentials
                res.status(401).send(`
                    <script>
                        alert("Invalid username or password. Please try again.");
                        window.location.href = "http://localhost:3300/signin-page";
                    </script>
                `);
                console.log("Sign In Failed");
            }
        }
    })
})

/* FOR PRODUCT AND PRODUCT DETAIL PAGE */
router.get("/product_detail", (req, res) => {
    const sku = req.query.prod_SKU;
    // Validate the SKU parameter
    if (!sku) {
        return res.status(400).json({ error: 'SKU parameter is required' });
    }
    // Fetch product details from the database based on SKU
    connection.query('SELECT * FROM Product WHERE prod_SKU = ?', [sku], (error, results) => {
        if (error) {
            console.error('Error fetching product details:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        // Check if product details were found
        if (results.length === 0) {
            return res.status(404).json({ error: 'Product details not found' });
        }
        // Send the product details to the client
        const productDetails = results[0]; // Assuming only one product matches the SKU
        res.json(productDetails);
    })
})

router.get("/products", (req, res) => {
    connection.query('SELECT * FROM Product', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
});

// Endpoint to fetch product data from the database
router.get('/select', (req, res) => {
    let sql = 'SELECT * FROM Product WHERE 1 = 1'; // Initial query

    // Check if productName query parameter is provided
    if (req.query.productName) {
        const productName = req.query.productName;
        sql += ` AND prod_name LIKE '%${productName}%'`;
    }

    // Check if category query parameter is provided
    if (req.query.category && req.query.category !== 'All Products') {
        const category = req.query.category;
        sql += ` AND prod_category = '${category}'`;
    }

    // Check if minPrice and maxPrice query parameters are provided
    if (req.query.minPrice && req.query.maxPrice) {
        const minPrice = parseFloat(req.query.minPrice);
        const maxPrice = parseFloat(req.query.maxPrice);
        sql += ` AND (prod_price BETWEEN ${minPrice} AND ${maxPrice})`;
    }

    // Check if sortBy query parameter is provided
    if (req.query.sortBy) {
        const sortBy = req.query.sortBy;
        switch (sortBy) {
            case 'nameAZ':
                sql += ' ORDER BY prod_name ASC';
                break;
            case 'nameZA':
                sql += ' ORDER BY prod_name DESC';
                break;
            case 'priceLowToHigh':
                sql += ' ORDER BY prod_price ASC';
                break;
            case 'priceHighToLow':
                sql += ' ORDER BY prod_price DESC';
                break;
            default:
                return res.status(400).json({ error: true, message: 'Invalid sortBy option' });
        }
    }

    // Execute the query
    connection.query(sql, (error, results) => {
        if (error) {
            console.error('Error fetching product data:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    });
});


// Endpoint to fetch product data from the database based on category
router.get('/select_cat', (req, res) => {
    const category = req.query.category; // Get the category from the query parameter
    let sql;
    if (category) {
        // If a category is provided, filter products based on that category
        sql = `SELECT * FROM Product WHERE prod_category = ?`;
    } else {
        // If no category is provided, fetch all products
        sql = 'SELECT * FROM Product';
    }

    // Execute the query with or without category filtering
    connection.query(sql, [category], (error, results) => {
        if (error) {
            console.error('Error selecting products:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    })
})

// Endpoint to fetch product data from the database
router.get('/select_sort', (req, res) => {
    let sql = 'SELECT * FROM Product';

    // Check if sortBy query parameter is provided
    if (req.query.sortBy) {
        const sortBy = req.query.sortBy;
        switch (sortBy) {
            case 'nameAZ':
                sql += ' ORDER BY prod_name ASC';
                break;
            case 'nameZA':
                sql += ' ORDER BY prod_name DESC';
                break;
            case 'priceLowToHigh':
                sql += ' ORDER BY prod_price ASC';
                break;
            case 'priceHighToLow':
                sql += ' ORDER BY prod_price DESC';
                break;
            default:
                // Handle invalid sortBy option
                return res.status(400).json({ error: true, message: 'Invalid sortBy option' });
        }
    }
 
    // Execute the query
    connection.query(sql, (error, results) => {
        if (error) {
            console.error('Error fetching product data:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    });
});

router.get('/options', (req, res) => {
    connection.query('SELECT DISTINCT prod_category FROM Product', (error, results) => {
        if (error) {
            console.error('Error fetching categories:', error);
            res.status(500).json({ error: true, message: 'Internal server error' });
        } else {
            const categories = results.map(row => row.category);
            res.json({ categories });
        }
    })
})


router.get('/categories', (req, res) => {
    // Query to fetch category data from the database
    const sql = 'SELECT DISTINCT prod_category FROM Product';

    // Execute the query
    connection.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching categories:', err);
            res.status(500).json({ error: 'Error fetching categories' });
            return;
        }

        // Process the results and structure them in the desired format
        const categories = results.map(row => row.prod_category);

        // Send the structured data as the response
        res.json({ categories });
    })
})

router.get('/suggested-products', (req, res) => {
    const sql = 'SELECT * FROM Product ORDER BY RAND() LIMIT 6';
    connection.query(sql, (error, results) => {
        if (error) {
            console.error('Error fetching suggested products:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    });
});

/* START OF ADMIN MANAGEMENT */
router.get('/admin-account', (req, res) => {
    connection.query('SELECT * FROM Admin_Account', (error, results) => {
        if (error) {
            res.status(500).json({ error: 'Internal Server Error' });
        } else {
            res.json(results);
        }
    });
});

router.delete('/delete_user', (req, res) => {
    const username = req.query.username; // Get the username from the query parameter
    if (!username) {
        return res.status(400).json({ error: true, message: 'Username is required' });
    }

    // Query to delete the user from the database
    const deleteAdminAccount = 'DELETE FROM Admin_Account WHERE admin_username = ?';

    // Execute the delete query
    connection.query(deleteAdminAccount, [username], (error, results) => {
        if (error) {
            console.error('Error deleting user:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }

        // If the Admin_Account delete query was successful, proceed with deleting from the Login table
            console.log('DELETE Successfully')
            return res.status(200).json({ success: true, message: 'User deleted successfully' });
        });

});

router.post('/add_admin', (req, res) => {
    const { username, firstName, lastName, position, phoneNumber, image } = req.body;

    // Query to insert the new admin into the database
    const insertAdminAccount = 'INSERT INTO Admin_Account (admin_username, admin_fname, admin_lname, admin_position, admin_phone_number, admin_image) VALUES (?, ?, ?, ?, ?, ?)';

    // Execute the insert query
    connection.query(insertAdminAccount, [username, firstName, lastName, position, phoneNumber, image], (error, results) => {
        if (error) {
            console.error('Error adding new admin:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }

        console.log('New admin added successfully');
        return res.status(200).json({ success: true, message: 'New admin added successfully' });
    });
});
/* END OF ADMIN MANAGEMENT */

router.post('/add-product', (req, res) => {
    // Extract product data from the request body
    const newProduct = req.body.Product;
    console.log(newProduct);
    if (!newProduct) {
        return res.status(400).send({
            error: true, message: 'Please provide product information'
        });
    }
    connection.query("INSERT INTO Product SET ? ", newProduct, function (error, results) {
        if (error) throw error;
        // Send a response with a message
        return res.send({
            alertMessage: 'New product has been created successfully.'
        });
    });
});



router.post("/add_product", function(req, res){
    const product = req.body;
    connection.query("INSERT INTO product SET ? ", product, function(error, results) {
        if(error) {
            throw error;
        }
        return res.send({error: false, data: results.affectedRows, message: "New product has been created successfully."})
    });
});

// // Problem delete
router.delete('/delete_product', (req, res) => {
    const sku = req.query.sku; // Get the product SKU from the query parameter
    if (!sku) {
        return res.status(400).json({ error: true, message: 'Product SKU is required' });
    }

    // Query to delete the product from the database
    const sql = 'DELETE FROM Product WHERE prod_SKU = ?';
    // Execute the delete query
    connection.query(sql, [sku, sku], (error, results) => {
        if (error) {
            console.error('Error deleting product:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.status(200).json({ success: true, message: 'Product deleted successfully' });
    })
})

router.put('/update-product/:sku', (req, res) => {
    const sku = req.params.sku; // Get the SKU from the request parameters
    const updatedProduct = req.body; // Get the updated product data from the request body

    if (!sku || Object.keys(updatedProduct).length === 0) {
        return res.status(400).send({ error: true, message: 'Please provide a SKU and updated product data' });
    }

    connection.query('UPDATE Product SET ? WHERE prod_SKU = ?', [updatedProduct, sku], (error, results) => {
        if (error) {
            console.error('Error updating product:', error);
            return res.status(500).send({ error: true, message: 'Error updating product' });
        }
        return res.send({ error: false, data: results.affectedRows, message: 'Product updated successfully' });
    });
});



/* RUN SERVER */
app.listen(process.env.PORT, () => {
    console.log(`Server listening on port: ${process.env.PORT}`);
})