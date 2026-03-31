<?php
// Start session
if (session_id() == '' || !isset($_SESSION)) {
  session_start();
}

include 'config.php';

// Ambil action
$action = $_GET['action'] ?? null;

/* =====================
   EMPTY CART
===================== */
if ($action === 'empty') {
  unset($_SESSION['cart']);
  header("Location: cart.php");
  exit;
}

/* =====================
   ACTION YANG BUTUH ID
===================== */
$product_id = $_GET['id'] ?? null;

if (!$product_id) {
  header("Location: cart.php");
  exit;
}

// Ambil stok produk dari DB
$result = $mysqli->query("SELECT qty FROM products WHERE id = $product_id");

if ($result && $obj = $result->fetch_object()) {

  switch ($action) {

    case "add":
      if (!isset($_SESSION['cart'][$product_id])) {
        $_SESSION['cart'][$product_id] = 1;
      } elseif ($_SESSION['cart'][$product_id] + 1 <= $obj->qty) {
        $_SESSION['cart'][$product_id]++;
      }
      break;

    case "remove":
      if (isset($_SESSION['cart'][$product_id])) {
        $_SESSION['cart'][$product_id]--;
        if ($_SESSION['cart'][$product_id] <= 0) {
          unset($_SESSION['cart'][$product_id]);
        }
      }
      break;
  }
}

// Balik ke cart
header("Location: cart.php");
exit;
