<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>KrishnaShop — Modern E-Commerce</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg: #ffffff;
            --primary: #0a2540;
            --accent: #00d4ff;
            --muted: #7a7a7a;
            --card: #ffffff;
            --surface: #f6f9fc;
            --success: #28a745;
            --radius: 12px;
            --container: 1200px;
        }

        * { box-sizing: border-box }

        body {
            margin: 0;
            font-family: Inter, system-ui;
            color: var(--primary);
            background: var(--bg);
        }

        a { text-decoration: none; color: inherit }

        .container {
            max-width: var(--container);
            margin: auto;
            padding: 0 20px;
        }

        header {
            position: sticky;
            top: 0;
            background: white;
            border-bottom: 1px solid #eee;
            z-index: 10;
        }

        .header-inner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 0;
        }

        .brand {
            font-family: Poppins;
            font-size: 20px;
            font-weight: 700;
        }

        .accent { color: var(--accent) }

        nav ul {
            display: flex;
            gap: 14px;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .search {
            background: var(--surface);
            padding: 6px 12px;
            border-radius: 999px;
            display: flex;
            gap: 8px;
        }

        .search input {
            border: 0;
            outline: none;
            background: transparent;
        }

        .hero {
            background:
                linear-gradient(rgba(0,0,0,.5), rgba(0,0,0,.5)),
                url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80')
                center/cover no-repeat;
            color: white;
            text-align: center;
            padding: 80px 20px;
        }

        .grid {
            display: grid;
            gap: 20px;
        }

        .categories { grid-template-columns: repeat(auto-fit,minmax(150px,1fr)); }

        .cat-card {
            padding: 16px;
            border-radius: 12px;
            background: white;
            box-shadow: 0 6px 16px rgba(0,0,0,.05);
            text-align: center;
            cursor: pointer;
        }

        .products { grid-template-columns: repeat(auto-fit,minmax(220px,1fr)); }

        .product {
            position: relative;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 16px rgba(0,0,0,.05);
        }

        .product img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .product-body { padding: 12px }

        .add-btn {
            width: 100%;
            padding: 10px;
            border: none;
            background: var(--primary);
            color: white;
            cursor: pointer;
        }

        footer {
            border-top: 1px solid #eee;
            padding: 24px 0;
            margin-top: 40px;
            text-align: center;
            color: var(--muted);
        }
    </style>
</head>

<body>

<header>
    <div class="container header-inner">
        <div class="brand">Krishna<span class="accent">Shop</span></div>

        <nav>
            <ul>
                <li>Home</li>
                <li>Categories</li>
                <li>Deals</li>
                <li>About</li>
            </ul>
        </nav>

        <div class="search">
            <input type="search" id="searchInput" placeholder="Search products">
            <i class="fas fa-search"></i>
        </div>
    </div>
</header>

<section class="hero">
    <h1>Premium Summer Collection</h1>
    <p>Latest gadgets, fashion & accessories</p>
</section>

<section class="container" style="padding:40px 0">
    <h2>Categories</h2>
    <div class="grid categories" id="categoriesGrid"></div>
</section>

<section class="container" style="padding-bottom:40px">
    <h2>Viral Products</h2>
    <div class="grid products" id="productsGrid"></div>
</section>

<footer>
    © <span id="year"></span> KrishnaShop. All rights reserved.
</footer>

<script>
const CATEGORIES = [
    {name:'Phones',icon:'fa-mobile'},
    {name:'Laptops',icon:'fa-laptop'},
    {name:'Accessories',icon:'fa-watch'}
];

const PRODUCTS = [
    {id:1,title:'iPhone 14',price:999,img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb'},
    {id:2,title:'MacBook Pro',price:1999,img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45'}
];

const categoriesGrid = document.getElementById('categoriesGrid');
const productsGrid = document.getElementById('productsGrid');

CATEGORIES.forEach(c=>{
    categoriesGrid.innerHTML += `
        <div class="cat-card">
            <i class="fas ${c.icon}"></i>
            <h4>${c.name}</h4>
        </div>`;
});

PRODUCTS.forEach(p=>{
    productsGrid.innerHTML += `
        <div class="product">
            <img src="${p.img}" alt="${p.title}">
            <div class="product-body">
                <h4>${p.title}</h4>
                <strong>$${p.price}</strong>
            </div>
            <button class="add-btn">Add to Cart</button>
        </div>`;
});

document.getElementById('year').textContent = new Date().getFullYear();
</script>

</body>
</html>
