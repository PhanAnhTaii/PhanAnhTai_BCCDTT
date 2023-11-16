<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Voucher;

class VoucherController extends Controller
{
    public function trash()   
    {
        $brands = Brand::where('trash',1)
        ->brandBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $brands],
            200 );
    }
public function sortdelete(Request $request,$id){
    $brand = Brand::find($id);
    $brand->trash = '1';
    $brand->save(); //Luuu vao CSDL
        if($brand==null){
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
    $brand = Brand::find($id);
    $brand->trash = '0';
    $brand->save(); //Luuu vao CSDL
        if($brand==null){
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
        $Vouchers = Voucher::orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Vouchers],
            200 );
    }
    public function show($id)
    {
        $Voucher = Voucher::find($id);
        if($Voucher==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Voucher],
            200
        );
    }

    public function store(Request $request)   
    {
        $Voucher =  new Voucher();
        $Voucher->voucher_code = $request->voucher_code; //form
        $Voucher->reduced_value = $request->reduced_value; //form
        $Voucher->status = $request->status; //form
        $Voucher->created_at = date('Y-m-d H:i:s');
        $Voucher->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $Voucher],
            201 );
    }
    public function update(Request $request, $id)
    {
        $Voucher = Voucher::find($id);
        $Voucher->voucher_code = $request->voucher_code; //form
        $Voucher->reduced_value = $request->reduced_value; //form
        $Voucher->status = $request->status; //form
        $Voucher->created_at = date('Y-m-d H:i:s');
        $Voucher->save(); //Luuu vao CSDL
        if($Voucher==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }

        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $Voucher],
            200
        );
    }
    public function destroy($id)
    {
        $Voucher=Voucher::find($id);
        if($Voucher==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $Voucher->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}

}
