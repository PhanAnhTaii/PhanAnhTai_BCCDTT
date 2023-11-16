<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\BrandController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\SliderController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\TopicController;
use App\Http\Controllers\Api\PolicyController;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\VoucherController;

Route::get('brand/index',[BrandController::class,'index']);
Route::get('brand/show/{id}', [BrandController::class, 'show']);
Route::post('brand/store', [BrandController::class, 'store']);
Route::post('brand/update/{id}', [BrandController::class, 'update']);
Route::delete('brand/destroy/{id}', [BrandController::class, 'destroy']);
Route::post('brand/sortdelete/{id}', [BrandController::class, 'sortdelete']);
Route::post('brand/restore/{id}', [BrandController::class, 'restore']);
Route::get('brand/trash',[BrandController::class,'trash']);

Route::get('category/index',[CategoryController::class,'index']);
Route::get('category/show/{id}', [CategoryController::class, 'show']);
Route::post('category/store', [CategoryController::class, 'store']);
Route::post('category/update/{id}', [CategoryController::class, 'update']);
Route::delete('category/destroy/{id}', [CategoryController::class, 'destroy']);
Route::post('category/sortdelete/{id}', [CategoryController::class, 'sortdelete']);
Route::post('category/restore/{id}', [CategoryController::class, 'restore']);
Route::get('category/trash',[CategoryController::class,'trash']);

Route::get('order/index',[OrderController::class,'index']);
Route::get('order/show/{id}', [OrderController::class, 'show']);
Route::post('order/store', [OrderController::class, 'store']);
Route::post('order/update/{id}', [OrderController::class, 'update']);
Route::delete('order/destroy/{id}', [OrderController::class, 'destroy']);
Route::post('order/sortdelete/{id}', [OrderController::class, 'sortdelete']);
Route::post('order/restore/{id}', [OrderController::class, 'restore']);
Route::get('order/trash',[OrderController::class,'trash']);


Route::get('product/index',[ProductController::class,'index']);
Route::get('product/show/{id}', [ProductController::class, 'show']);
Route::post('product/store', [ProductController::class, 'store']);
Route::post('product/update/{id}', [ProductController::class, 'update']);
Route::delete('product/destroy/{id}', [ProductController::class, 'destroy']);
Route::post('product/sortdelete/{id}', [ProductController::class, 'sortdelete']);
Route::post('product/restore/{id}', [ProductController::class, 'restore']);
Route::get('product/trash',[ProductController::class,'trash']);

Route::get('slider/index',[SliderController::class,'index']);
Route::get('slider/show/{id}', [SliderController::class, 'show']);
Route::post('slider/store', [SliderController::class, 'store']);
Route::post('slider/update/{id}', [SliderController::class, 'update']);
Route::delete('slider/destroy/{id}', [SliderController::class, 'destroy']);
Route::post('slider/sortdelete/{id}', [SliderController::class, 'sortdelete']);
Route::post('slider/restore/{id}', [SliderController::class, 'restore']);
Route::get('slider/trash',[SliderController::class,'trash']);

Route::get('user/index',[UserController::class,'index']);
Route::get('user/show/{id}', [UserController::class, 'show']);
Route::post('user/store', [UserController::class, 'store']);
Route::post('user/register', [UserController::class, 'register']);
Route::post('user/update/{id}', [UserController::class, 'update']);
Route::delete('user/destroy/{id}', [UserController::class, 'destroy']);
Route::post('user/login', [UserController::class, 'login']);
Route::post('user/sortdelete/{id}', [UserController::class, 'sortdelete']);
Route::post('user/restore/{id}', [UserController::class, 'restore']);
Route::get('user/trash',[UserController::class,'trash']);

Route::get('menu/index',[MenuController::class,'index']);
Route::get('menu/show/{id}', [MenuController::class, 'show']);
Route::post('menu/store', [MenuController::class, 'store']);
Route::post('menu/update/{id}', [MenuController::class, 'update']);
Route::delete('menu/destroy/{id}', [MenuController::class, 'destroy']);
Route::post('menu/sortdelete/{id}', [MenuController::class, 'sortdelete']);
Route::post('menu/restore/{id}', [MenuController::class, 'restore']);
Route::get('menu/trash',[MenuController::class,'trash']);

Route::get('voucher/index',[VoucherController::class,'index']);
Route::get('voucher/show/{id}', [VoucherController::class, 'show']);
Route::post('voucher/store', [VoucherController::class, 'store']);
Route::post('voucher/update/{id}', [VoucherController::class, 'update']);
Route::delete('voucher/destroy/{id}', [VoucherController::class, 'destroy']);

Route::get('contact/index',[ContactController::class,'index']);
Route::get('contact/show/{id}', [ContactController::class, 'show']);
Route::post('contact/store', [ContactController::class, 'store']);
Route::post('contact/update/{id}', [ContactController::class, 'update']);
Route::delete('contact/destroy/{id}', [ContactController::class, 'destroy']);
Route::post('contact/sortdelete/{id}', [ContactController::class, 'sortdelete']);
Route::post('contact/restore/{id}', [ContactController::class, 'restore']);
Route::get('contact/trash',[ContactController::class,'trash']);

Route::get('post/index',[PostController::class,'index']);
Route::get('post/show/{id}', [PostController::class, 'show']);
Route::post('post/store', [PostController::class, 'store']);
Route::post('post/update/{id}', [PostController::class, 'update']);
Route::delete('post/destroy/{id}', [PostController::class, 'destroy']);
Route::get('post_home/{limit}/{topic_id?}',[PostController::class,'post_home']);
Route::post('post/sortdelete/{id}', [PostController::class, 'sortdelete']);
Route::post('post/restore/{id}', [PostController::class, 'restore']);
Route::get('post/trash',[PostController::class,'trash']);

Route::get('topic/index',[TopicController::class,'index']);
Route::get('topic/show/{id}', [TopicController::class, 'show']);
Route::post('topic/store', [TopicController::class, 'store']);
Route::post('topic/update/{id}', [TopicController::class, 'update']);
Route::delete('topic/destroy/{id}', [TopicController::class, 'destroy']);
Route::post('topic/sortdelete/{id}', [TopicController::class, 'sortdelete']);
Route::post('topic/restore/{id}', [TopicController::class, 'restore']);
Route::get('topic/trash',[TopicController::class,'trash']);

Route::get('menu_list/{position}/{parent_id?}',[MenuController::class,'menu_list']);
Route::get('slider_list/{position}',[SliderController::class,'slider_list']);
Route::get('category_list/{parent_id?}',[CategoryController::class,'category_list']);

Route::get('product_home/{limit}/{category_id?}',[ProductController::class,'product_home']);
Route::get('product_all/{limit}/{page?}',[ProductController::class,'product_all']);
Route::get('product_detail/{slug}',[ProductController::class,'product_detail']);
Route::get('product_brand/{brand_id}/{limit}/{page?}',[ProductController::class,'product_brand']);
Route::get('product_category/{category_id}/{limit}',[ProductController::class,'product_category']);
Route::get('product_search/{key}', [ProductController::class, 'product_search']);
Route::get('product_sale/{limit}/{page?}', [ProductController::class, 'product_sale']);
Route::get('product_best/{limit}/{page?}', [ProductController::class, 'product_best']);
Route::get('product_new/{limit}/{page?}', [ProductController::class, 'product_new']);
Route::post('product/fill', [ProductController::class, 'getFillProduct']);
    
Route::get('topic_list/{parent_id?}',[TopicController::class,'topic_list']);
Route::get('post_topic/{topic_id}/{limit}',[PostController::class,'post_topic']);
Route::get('post_detail/{slug}',[PostController::class,'post_detail']);
Route::get('post_list/{type}/{limit}',[PostController::class,'post_list']);


Route::get('policy/index',[PolicyController::class,'index']);
Route::get('policy/show/{id}', [PolicyController::class, 'show']);
Route::post('policy/store', [PolicyController::class, 'store']);
Route::post('policy/update/{id}', [PolicyController::class, 'update']);
Route::delete('policy/destroy/{id}', [PolicyController::class, 'destroy']);
Route::get('policy_list/{title}/{limit}',[PolicyController::class,'policy_list']);
Route::post('policy/sortdelete/{id}', [PolicyController::class, 'sortdelete']);
Route::post('policy/restore/{id}', [PolicyController::class, 'restore']);
Route::get('policy/trash',[PolicyController::class,'trash']);

Route::get('customer/index',[CustomerController::class,'index']);
Route::get('customer/show/{id}', [CustomerController::class, 'show']);
Route::post('customer/store', [CustomerController::class, 'store']);
Route::post('customer/update/{id}', [CustomerController::class, 'update']);
Route::delete('customer/destroy/{id}', [CustomerController::class, 'destroy']);
Route::post('customer/sortdelete/{id}', [CustomerController::class, 'sortdelete']);
Route::post('customer/restore/{id}', [CustomerController::class, 'restore']);
Route::get('customer/trash',[CustomerController::class,'trash']);

