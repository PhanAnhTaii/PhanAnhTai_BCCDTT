<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Menu;

class MenuController extends Controller
{
    public function trash()   
    {
        $Menus = Menu::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Menus],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Menu = Menu::find($id);
    $Menu->trash = '1';
    $Menu->save(); //Luuu vao CSDL
        if($Menu==null){
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
    $Menu = Menu::find($id);
    $Menu->trash = '0';
    $Menu->save(); //Luuu vao CSDL
        if($Menu==null){
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
        $menus = Menu::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $menus],
            200 );
    }
    public function show($id)
    {
        $menu = Menu::find($id);
        if($menu==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $menu],
            200
        );
    }

    public function store(Request $request)   
    {
        $menu =  new Menu();
        $menu->name = $request->name; //form
        $menu->link = $request->link; //form
        $menu->position = $request->position; //form
        $menu->parent_id = $request->parent_id; //form
        
        $menu->created_by = 1;
        $menu->status = $request->status; //form
        $menu->created_at = date('Y-m-d H:i:s');
        $menu->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $menu],
            201 );
    }
    public function update(Request $request, $id)
    {
        $menu = Menu::find($id);
        if($menu==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $menu->name = $request->name; //form
        $menu->link = $request->link; //form
        $menu->parent_id = $request->parent_id; //form

        $menu->position = $request->position; //form
        
        $menu->created_by = 1;
        $menu->status = $request->status; //form
        $menu->created_at = date('Y-m-d H:i:s');
        $menu->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $menu],
            200
        );
    }
    public function destroy($id)
    {
        $menu=Menu::find($id);
        if($menu==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $menu->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
public function menu_list($position, $parent_id = 0)
{
    $args = [
        ['position', '=', $position],
        ['parent_id', '=', $parent_id],
        ['status', '=', 1]
    ];
    $menus = Menu::where($args)
        
        ->get();
        if(count($menus)){
    return response()->json(
        [
            'success' => true,
            'message' => 'Tải dữ liệu thành công',
            'menus' => $menus
        ],
        200
    );
}
else{
    return response()->json(
        [
            'success' => false,
            'message' => 'Không có dữ liệu',
            'menus' => null
        ],
        200
    );
}
}


}
