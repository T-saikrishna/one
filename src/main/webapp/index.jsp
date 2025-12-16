<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>new_lookShop — Modern E-Commerce</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg: #f8fafc;
            --primary: #0f172a;
            --accent: #6366f1;
            --muted: #64748b;
            --card: #ffffff;
            --surface: #eef2ff;
            --radius: 14px;
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

        /* Header */
        header {
            position: sticky;
            top: 0;
            background: white;
            border-bottom: 1px solid #e5e7eb;
            z-index: 10;
        }

        .header-inner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 0;
        }

        .brand {
            font-family: Poppins;
            font-size: 22px;
            font-weight: 700;
        }

        .accent { color: var(--accent) }

        nav ul {
            display: flex;
            gap: 18px;
            list-style: none;
            padding: 0;
            margin: 0;
            font-weight: 500;
        }

        nav li {
            cursor: pointer;
            color: var(--muted);
        }

        nav li:hover {
            color: var(--accent);
        }

        .search {
            background: var(--surface);
            padding: 8px 14px;
            border-radius: 999px;
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .search input {
            border: 0;
            outline: none;
            background: transparent;
        }

        /* Hero */
        .hero {
            background:
                linear-gradient(rgba(15,23,42,.7), rgba(15,23,42,.7)),
                url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80')
                center/cover no-repeat;
            color: white;
            text-align: center;
            padding: 100px 20px;
        }

        .hero h1 {
            font-family: Poppins;
            font-size: 42px;
            margin-bottom: 12px;
        }

        .hero p {
            font-size: 18px;
            opacity: 0.9;
        }

        /* Grids */
        .grid {
            display: grid;
            gap: 22px;
        }

        .categories {
            grid-template-columns: repeat(auto-fit,minmax(160px,1fr));
            margin-top: 20px;
        }

        .cat-card {
            padding: 22px;
            border-radius: var(--radius);
            background: white;
            box-shadow: 0 10px 25px rgba(0,0,0,.06);
            text-align: center;
            cursor: pointer;
            transition: transform .3s, box-shadow .3s;
        }

        .cat-card i {
            font-size: 26px;
            color: var(--accent);
            margin-bottom: 8px;
        }

        .cat-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 16px 40px rgba(0,0,0,.1);
        }

        .products {
            grid-template-columns: repeat(auto-fit,minmax(230px,1fr));
            margin-top: 20px;
        }

        .product {
            background: white;
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,.06);
            transition: transform .3s;
        }

        .product:hover {
            transform: translateY(-6px);
        }

        .product img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }

        .product-body {
            padding: 14px;
        }

        .product-body h4 {
            margin: 0 0 6px;
        }

        .product-body strong {
            color: var(--accent);
        }

        .add-btn {
            width: 100%;
            padding: 12px;
            border: none;
            background: linear-gradient(135deg, var(--accent), #4f46e5);
            color: white;
            cursor: pointer;
            font-weight: 600;
        }

        .add-btn:hover {
            opacity: .9;
        }

        footer {
            border-top: 1px solid #e5e7eb;
            padding: 28px 0;
            margin-top: 50px;
            text-align: center;
            color: var(--muted);
            background: white;
        }
    </style>
</head>

<body>

<header>
    <div class="container header-inner">
        <div class="brand">new_look<span class="accent">Shop</span></div>

        <nav>
            <ul>
                <li>Home</li>
                <li>Categories</li>
                <li>Deals</li>
                <li>About</li>
            </ul>
        </nav>

        <div class="search">
            <input type="search" placeholder="Search products">
            <i class="fas fa-search"></i>
        </div>
    </div>
</header>

<section class="hero">
    <h1>Premium Summer Collection</h1>
    <p>Latest gadgets, fashion & accessories</p>
</section>

<section class="container" style="padding:50px 0">
    <h2>Categories</h2>
    <div class="grid categories" id="categoriesGrid"></div>
</section>

<section class="container" style="padding-bottom:50px">
    <h2>Viral Products</h2>
    <div class="grid products" id="productsGrid"></div>
</section>

<footer>
    © <span id="year"></span> new_lookShop. All rights reserved.
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
