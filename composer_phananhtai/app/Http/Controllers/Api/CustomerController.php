<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Customer;

class CustomerController extends Controller
{
    public function trash()   
    {
        $Customers = Customer::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Customers],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Customer = Customer::find($id);
    $Customer->trash = '1';
    $Customer->save(); //Luuu vao CSDL
        if($Customer==null){
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
    $Customer = Customer::find($id);
    $Customer->trash = '0';
    $Customer->save(); //Luuu vao CSDL
        if($Customer==null){
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
        $Customers = Customer::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Customers],
            200 );
    }
    public function show($id)
    {
        $Customer = Customer::find($id);
        if($Customer==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Customer],
            200
        );
    }

    public function store(Request $request)   
    {
        $Customer =  new Customer();
        $Customer->name = $request->name; //form
        $Customer->dateofbirth = $request->dateofbirth; //form
        $Customer->sex = $request->sex; //form
        $Customer->nationality = $request->nationality; //form
        $Customer->address = $request->address; //form
        $Customer->phone = $request->phone; //form
        $Customer->email = $request->email; //form
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $Customer->name . '.' . $extension;
                $Customer->image = $filename;
                $files->move(public_path('images/customer'), $filename);
            }
        }
        $Customer->created_by = 1;
        $Customer->status = $request->status; //form
        $Customer->created_at = date('Y-m-d H:i:s');
        $Customer->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $Customer],
            201 );
    }
    public function update(Request $request, $id)
    {
        $Customer = Customer::find($id);
        $Customer->name = $request->name; //form
        $Customer->dateofbirth = $request->dateofbirth; //form
        $Customer->sex = $request->sex; //form
        $Customer->nationality = $request->nationality; //form
        $Customer->address = $request->address; //form
        $Customer->phone = $request->phone; //form
        $Customer->email = $request->email; //form
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $Customer->name . '.' . $extension;
                $Customer->image = $filename;
                $files->move(public_path('images/customer'), $filename);
            }
        }
        $Customer->created_by = 1;
        $Customer->status = $request->status; //form
        $Customer->created_at = date('Y-m-d H:i:s');
        $Customer->save(); //Luuu vao CSDL
        if($Customer==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }

        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $Customer],
            200
        );
    }
    public function destroy($id)
    {
        $Customer=Customer::find($id);
        if($Customer==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $Customer->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
}
