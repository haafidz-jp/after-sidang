<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Landing::index');

// $routes->group('', ['filter' => 'login','admin'], function($routes){
//     $routes->get('/dashboard', 'Dashboard::index');
//     $routes->get('/produk/*', 'Produk::index');
//     $routes->get('/supplier/*', 'Supplier::index');
// });

// $routes->get('/produk', 'Produk::index', ['filter' => 'role:admin']);
// $routes->get('/supplier', 'Supplier::index', ['filter' => 'role:admin']);
// $routes->get('/supplier/add_data', 'Supplier::add_data', ['filter' => 'role:admin']);
// $routes->get('/supplier/update_data', 'Supplier::update_data', ['filter' => 'role:admin']);

// $routes->get('/export-pdf', 'Export::export_pdf', ['filter' => 'role:admin']);
$routes->get('/cetakproduk', 'CetakProduk::cetaklaporanproduk', ['filter' => 'role:admin']);
$routes->get('/cetakmasuk', 'CetakProdukMasuk::index', ['filter' => 'role:admin']);
$routes->get('/cetakkeluar', 'CetakProdukKeluar::index', ['filter' => 'role:admin']);

// $routes->get('/export-excel', 'Export::export_excel', ['filter' => 'role:admin']);

// $routes->get('/dashboard', 'Dashboard::index', ['filter' => 'login','role:admin']);

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
