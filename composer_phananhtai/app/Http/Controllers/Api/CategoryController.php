<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoryController extends Controller
{ 
    public function trash()   
    {
        $Categorys = Category::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Categorys],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Category = Category::find($id);
    $Category->trash = '1';
    $Category->save(); //Luuu vao CSDL
        if($Category==null){
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
    $Category = Category::find($id);
    $Category->trash = '0';
    $Category->save(); //Luuu vao CSDL
        if($Category==null){
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
        $categorys = Category::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $categorys],
            200 );
    }
    public function show($id)
    {
        if(is_numeric($id))
        {
            $category = Category::find($id);
        }
        else{
            $category = Category::where('slug',$id)->first();;
        }
        if($category==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );  
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $category],
            200
        );
    }

    public function store(Request $request)   
    {
        $category =  new Category();
        $category->name = $request->name; //form
        $category->slug = Str::of($request->name)->slug('-');

        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $category->slug . '.' . $extension;
                $category->image = $filename;
                $files->move(public_path('images/category'), $filename);
            }
        }
        
        $category->parent_id = $request->parent_id;
        $category->sort_order = $request->sort_order; //form
        $category->metakey = $request->metakey; //form
        $category->metadesc = $request->metadesc; //form
        $category->created_by = 1;
        $category->status = $request->status; //form
        $category->created_at = date('Y-m-d H:i:s');
        $category->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $category],
            201 );
    }
    public function update(Request $request, $id)
    {
        $category = Category::find($id);
        $category->name = $request->name; //form
        $category->slug = Str::of($request->name)->slug('-');

        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $category->slug . '.' . $extension;
                $category->image = $filename;
                $files->move(public_path('images/category'), $filename);
            }
        }
        
        $category->parent_id = $request->parent_id;
        $category->sort_order = $request->sort_order; //form
        $category->metakey = $request->metakey; //form
        $category->metadesc = $request->metadesc; //form
        $category->created_by = 1;
        $category->status = $request->status; //form
        $category->created_at = date('Y-m-d H:i:s');
        $category->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $category],
            201 );
    }
    public function destroy($id)
    {
        $category=Category::find($id);
        if($category==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $category->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
public function category_list($parent_id = 0)
    {
        $args = [
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $categorys = Category::where($args)
            ->orderBy('sort_order', 'ASC')
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'categorys' => $categorys
            ],
            200
        );
    }



}
