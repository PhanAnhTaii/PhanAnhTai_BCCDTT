<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;


class ProductController extends Controller
{
    public function trash()   
    {
        $Product = Product::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Product],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Product = Product::find($id);
    $Product->trash = '1';
    $Product->save(); //Luuu vao CSDL
        if($Product==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
public function restore(Request $request,$id){
    $Product = Product::find($id);
    $Product->trash = '0';
    $Product->save(); //Luuu vao CSDL
        if($Product==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
    public function index()   
    {
        $products = Product::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $products],
            200 );
    }
    public function show($id)
    {
        $product = Product::find($id);
        if($product==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $product],
            200
        );
    }
    

    public function store(Request $request)   
    {
        $product =  new Product();
        $product->category_id = $request->category_id; //form
        $product->brand_id = $request->brand_id; //form
        $product->name = $request->name; //form
        $product->slug = Str::of($request->name)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $product->slug . '.' . $extension;
                $product->image = $filename;
                $files->move(public_path('images/product'), $filename);
            }
        }
        $product->price = $request->price; 
        $product->pricesale = $request->pricesale; 
        $product->qty = $request->qty; 
        $product->detail = $request->detail; 
        $product->metakey = $request->metakey; //form
        $product->metadesc = $request->metadesc; //form
        $product->created_by = 1;
        $product->status = $request->status; //form
        $product->created_at = date('Y-m-d H:i:s');
        $product->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $product],
            201 );
    }
    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        $product->category_id = $request->category_id; //form
        $product->brand_id = $request->brand_id; //form
        $product->name = $request->name; //form
        $product->slug = Str::of($request->name)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $product->slug . '.' . $extension;
                $product->image = $filename;
                $files->move(public_path('images/product'), $filename);
            }
        }
        $product->price = $request->price; 
        $product->pricesale = $request->pricesale; 
        $product->qty = $request->qty; 
        $product->detail = $request->detail; 
        $product->metakey = $request->metakey; //form
        $product->metadesc = $request->metadesc; //form
        $product->created_by = 1;
        $product->status = $request->status; //form
        $product->created_at = date('Y-m-d H:i:s');
        $product->save(); //Luuu vao CSDL
        if($product==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $product],
            200
        );
    }
    public function destroy($id)
    {
        $product=Product::find($id);
        if($product==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $product->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
public function product_home($limit, $category_id = 0)
{
    $listid = array();
    array_push($listid, $category_id + 0);
    $args_cat1 = [
        ['parent_id', '=', $category_id + 0],
        ['status', '=', 1]
    ];
    $list_category1 = Category::where($args_cat1)->get();
    if (count($list_category1) > 0) {
        foreach ($list_category1 as $row1) {
            array_push($listid, $row1->id);
            $args_cat2 = [
                ['parent_id', '=', $row1->id],
                ['status', '=', 1]
            ];
            $list_category2 = Category::where($args_cat2)->get();
            if (count($list_category2) > 0) {
                foreach ($list_category2 as $row2) {
                    array_push($listid, $row2->id);
                }
            }
        }
    }
    $products = Product::where('status', '=', 1)
        ->whereIn('category_id', $listid)
        ->orderBy('pricesale', 'ASC')
        ->limit($limit)
        ->get();

        if(count($products)>0){
            return response()->json(
                [
                    'success' => true,
                    'message' => 'Tải dữ liệu thành công',
                    'products' => $products
                ],
                200
            );
        }
        else{
        return response()->json(
            [
                'success' => false,
                'message' => 'Tải dữ liệu thành công',
                'products' => null
            ],
            200
        );}
}
    public function product_all($limit, $page = 1)
    {
        $offset = ($page - 1) * $limit;
        $products = Product::where('status', 1)
            ->orderBy('pricesale', 'ASC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'products' => $products
            ],
            200
        );
    }
    public function product_detail($slug)
    {
        $product=Product::where([['slug','=',$slug],['status', '=', 1]])->first();
        if($product==null){
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Không thành công',
                    'product' => null
                ],
                404
            );
        }
        $listid = array();
    array_push($listid, $product->category_id );
    $args_cat1 = [
        ['parent_id', '=', $product->category_id],
        ['status', '=', 1]
    ];
    $list_category1 = Category::where($args_cat1)->get();
    if (count($list_category1) > 0) {
        foreach ($list_category1 as $row1) {
            array_push($listid, $row1->id);
            $args_cat2 = [
                ['parent_id', '=', $row1->id],
                ['status', '=', 1]
            ];
            $list_category2 = Category::where($args_cat2)->get();
            if (count($list_category2) > 0) {
                foreach ($list_category2 as $row2) {
                    array_push($listid, $row2->id);
                }
            }
        }
    }
         $product_other=Product::where([['id','!=',$product->id],['status', '=', 1]])
         ->orderBy('created_at','DESC')
         ->whereIn('category_id',$listid)
         ->limit(8)
         ->get();
            return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'product' => $product,
                'product_other'=>$product_other
            ],
            200
        );
        
    }
    public function product_brand($product_id, $limit, $page = 1)
    {
        $offset = ($page - 1) * $limit;
        $products = Product::where([
        ['brand_id', '=', $product_id], 
        ['status', '=', 1]])
            ->orderBy('pricesale', 'ASC')
            ->offset($offset)
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'products' => $products
            ],
            200
        );
    }
    public function product_category($category_id, $limit)
    {
        $listid = array();
        array_push($listid, $category_id + 0);
        $args_cat1 = [
            ['parent_id', '=', $category_id + 0],
            ['status', '=', 1]
        ];
        $list_category1 = Category::where($args_cat1)->get();
        if (count($list_category1) > 0) {
            foreach ($list_category1 as $row1) {
                array_push($listid, $row1->id);
                $args_cat2 = [
                    ['parent_id', '=', $row1->id],
                    ['status', '=', 1]
                ];
                $list_category2 = Category::where($args_cat2)->get();
                if (count($list_category2) > 0) {
                    foreach ($list_category2 as $row2) {
                        array_push($listid, $row2->id);
                    }
                }
            }
        }
        $products = Product::where('status', 1)
            ->whereIn('category_id', $listid)
            ->orderBy('pricesale', 'ASC')
            
            ->limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'products' => $products
            ],
            200
        );
    }
    public function product_search($key)
    {
        $args = [
            ['name',"Like" , "%$key%"],
            ['status', '=', 1]
        ];
        $products = Product::where($args)
            ->get();
        if(count($products) > 0){
            return response()->json(
                [
                    'success' => true,
                    'message' => 'Tải dữ liệu thành công',
                    'products' => $products
                ],
                200
            );    
        }
        else{
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Không có dữ liệu',
                    'products' => null
                ],
                200
            );    
        }
    }
    public function product_sale($limit,$page=1)
    {
        $products_all=Product::where('status',1)
        ->orderBy('created_at','DESC')
        ->get();
        $end_page=1;
        if(count($products_all)>$limit){
            $end_page=ceil(count($products_all)/$limit);
        }
        $offset=($page-1)*$limit;
        $products=Product::where([['sale_id','!=',0],['status','=',1]])
        ->orderBy('created_at', 'DESC')
        ->offset($offset)
        ->limit($limit)
        ->get();
        if(count($products)>0){
            return response()->json(
                [
                    'success'=>true,
                    'message'=>'Tải dữ liệu thành công',
                    'sale_products'=>$products,
                    'end_page'=>$end_page

                ],
                200
            );
        }else{
            return response()->json(
                [
                    'success'=>false,
                    'message'=>'Tải dữ không liệu thành công',
                    'sale_products'=>0,
                    'end_page'=>$end_page

                ],
                200
            );
        }
    }
    public function product_best($limit,$page=1)
    {
        $products_all=Product::where('status',1)
        ->orderBy('created_at','DESC')
        ->get();
        $end_page=1;
        if(count($products_all)>$limit){
            $end_page=ceil(count($products_all)/$limit);
        }
        $offset=($page-1)*$limit;
        $products=Product::where([['status','=',1]])
        ->orderBy('qty', 'DESC')
        ->offset($offset)
        ->limit($limit)
        ->get();
        if(count($products)>0){
            return response()->json(
                [
                    'success'=>true,
                    'message'=>'Tải dữ liệu thành công',
                    'best_products'=>$products,
                    'end_page'=>$end_page

                ],
                200
            );
        }else{
            return response()->json(
                [
                    'success'=>false,
                    'message'=>'Tải dữ không liệu thành công',
                    'best_products'=>0,
                    'end_page'=>$end_page

                ],
                200
            );
        }
    }
    public function product_new($limit,$page=1)
    {
        $products_all=Product::where('status',1)
        ->orderBy('created_at','DESC')
        ->get();
        $end_page=1;
        if(count($products_all)>$limit){
            $end_page=ceil(count($products_all)/$limit);
        }
        $offset=($page-1)*$limit;
        $products=Product::where([['status','=',1]])
        ->orderBy('created_at', 'DESC')
        ->offset($offset)
        ->limit($limit)
        ->get();
        if(count($products)>0){
            return response()->json(
                [
                    'success'=>true,
                    'message'=>'Tải dữ liệu thành công',
                    'sale_products'=>$products,
                    'end_page'=>$end_page

                ],
                200
            );
        }else{
            return response()->json(
                [
                    'success'=>false,
                    'message'=>'Tải dữ không liệu thành công',
                    'sale_products'=>0,
                    'end_page'=>$end_page

                ],
                200
            );
        }
    }
    public function getFillProduct(Request $request)
    {
        $url=$request->segment(2);
        $url=preg_split('/(-)/i',$url);
        if($id=array_pop($url))
        {
            $products=Product ::where([
                'category_id'=>$id,
                'pro_active'=>Product::STATUS_PUBLIC
            ]);
            if($request->price)
            {
                $price=$request->price;
                switch($price)
                {
                    case '1':
                        $products->where('price','<',1000000);
                        break;
                    case '2':
                        $products->whereBetween('price','<',[1000000,3000000]);
                        break;
                    case '3':
                        $products->whereBetween('price','<',[3000000,5000000]);
                        break;
                    case '4':
                        $products->whereBetween('price','<',[5000000,7000000]);
                        break;
                    case '5':
                        $products->whereBetween('price','<',[7000000,10000000]);
                        break;    
                    case '6':
                        $products->where('price','>',10000000);
                        break;
                }
            }
            if($request->orderBy)
            {
                $orderby=$request->orderby;
                switch($orderby)
                {
                    case 'desc':
                        
                }
            }
            $products=$products->orderBy('id','DESC')->paginate(9);
            $cateProduct=Category::find($id);
            $viewData=[
                'products'=>$products,
                'cateProduct'=>$cateProduct,
            ];
            return view('product.index',$viewData);
        }
        return redirect('/');
    }
    
}
