<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function trash()   
    {
        $Users = User::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Users],
            200 );
    }
public function sortdelete(Request $request,$id){
    $User = User::find($id);
    $User->trash = '1';
    $User->save(); //Luuu vao CSDL
        if($User==null){
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
    $User = User::find($id);
    $User->trash = '0';
    $User->save(); //Luuu vao CSDL
        if($User==null){
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
        $users = User::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $users],
            200 );
    }
    public function show($id)
    {
        $user = User::find($id);
        if($user==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $user],
            200
        );
    }

    public function store(Request $request)   
    {
        $user =  new User();
        $user->name = $request->name; //form
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $user->name . '.' . $extension;
                $user->image = $filename;
                $files->move(public_path('images/user'), $filename);
            }
        }
        $user->phone = $request->phone; //form
        $user->email = $request->email; //form
        $user->username = $request->username; //form
        $user->password1 = $request->password1; //form
        $user->address = $request->address; //form
        $user->roles = $request->roles; //form
        $user->created_by = 1;
        $user->status = $request->status; //form
        $user->created_at = date('Y-m-d H:i:s');
        $user->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $user],
            201 );
    }
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $user->name = $request->name; //form
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $user->name . '.' . $extension;
                $user->image = $filename;
                $files->move(public_path('images/user'), $filename);
            }
        }
        $user->phone = $request->phone; //form
        $user->email = $request->email; //form
        $user->username = $request->username; //form
        $user->password1 = $request->password1; //form
        $user->address = $request->address; //form
        $user->roles = $request->roles; //form
        $user->created_by = 1;
        $user->status = $request->status; //form
        $user->created_at = date('Y-m-d H:i:s');
        $user->save(); //Luuu vao CSDL
        if($user==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }

        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $user],
            200
        );
    }
    public function destroy($id)
    {
        $user=User::find($id);
        if($user==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $user->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
public function register(Request $request)   
    {
        $user =  new User();
        $user->name = $request->name; //form
        $user->email = $request->email; //form
        $user->username = $request->username; //form
        $user->password1 = $request->password1; //form
        $user->roles = $request->roles; //form
        $user->created_by = 1;
        $user->status = $request->status; //form
        $user->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $user],
            201 );
    }
public function login(Request $request){
    $arg = [
        ['email','=',$request->email],
        ['password1','=',$request->password1],
        ['roles','=',$request->roles],
        ['status','=',1]
    ];
    $user = User::where($arg) -> first();
    if($user!=null){
        return response()->json(['success' => true,'message'=>'Đăng nhập thành công', 'data' => $user],200);
    }
    else{
        return response()->json(['success' => false,'message'=>'Đăng nhập thất bại', 'data' => null],404);
    }
}

}           
