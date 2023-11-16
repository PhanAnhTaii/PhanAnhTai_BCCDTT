<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Policy;
use Illuminate\Support\Str;

class PolicyController extends Controller
{
    public function trash()   
    {
        $Policys = Policy::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Policys],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Policy = Policy::find($id);
    $Policy->trash = '1';
    $Policy->save(); //Luuu vao CSDL
        if($Policy==null){
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
    $Policy = Policy::find($id);
    $Policy->trash = '0';
    $Policy->save(); //Luuu vao CSDL
        if($Policy==null){
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
        $policys = Policy::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $policys],
            200 );
    }
    public function show($id)
    {
        $policys = Policy::find($id);
        if($policys==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $policys],
            200
        );
    }
    public function store(Request $request)   
    {
        $Policy =  new Policy();
        $Policy->title = $request->title; //form
        $Policy->slug = Str::of($request->title)->slug('-');
        $Policy->detail = $request->detail; //form
        $Policy->metakey = $request->metakey; //form
        $Policy->metadesc = $request->metadesc; //form
        $Policy->created_by = 1;
        $Policy->status = $request->status; //form
        $Policy->created_at = date('Y-m-d H:i:s');
        $Policy->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $Policy],
            201 );
    }
    public function update(Request $request, $id)
    {
        $Policy = Policy::find($id);
        if($Policy==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $Policy->title = $request->title; //form
        $Policy->slug = Str::of($request->title)->slug('-');
        $Policy->detail = $request->detail; //form
        $Policy->metakey = $request->metakey; //form
        $Policy->metadesc = $request->metadesc; //form
        $Policy->created_by = 1;
        $Policy->status = $request->status; //form
        $Policy->created_at = date('Y-m-d H:i:s');
        $Policy->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $Policy],
            201 );
    }
    public function destroy($id)
    {
        $Policy=Policy::find($id);
        if($Policy==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $Policy->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
function policy_list($title, $limit)
    {
        $args = [
            ['title', '=', $title],
            ['status', '=', 1]
        ];
        $policys = Policy::where($args)
            ->orderBy('created_at', 'DESC')
            -> limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'policys' => $policys
            ],
            200
        );
    }

}
