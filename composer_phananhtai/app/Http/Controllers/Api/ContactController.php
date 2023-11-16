<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Contact;

class ContactController extends Controller
{
    public function trash()   
    {
        $contacts = Contact::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $contacts],
            200 );
    }
public function sortdelete(Request $request,$id){
    $contact = Contact::find($id);
    $contact->trash = '1';
    $contact->save(); //Luuu vao CSDL
        if($contact==null){
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
    $contact = Contact::find($id);
    $contact->trash = '0';
    $contact->save(); //Luuu vao CSDL
        if($contact==null){
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
        $contacts = Contact::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $contacts],
            200 );
    }
    public function show($id)
    {
        $contact = Contact::find($id);
        if($contact==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );  
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $contact],
            200
        );
    }

    public function store(Request $request)   
    {
        $contact =  new Contact();
        $contact->user_id = $request->user_id; //form
        $contact->name = $request->name; //form
        $contact->email = $request->email;
        $contact->phone = $request->phone; //form
        $contact->title = $request->title; //form
        $contact->content = $request->content; //form
        $contact->created_by = 1;
        $contact->status = $request->status; //form
        $contact->created_at = date('Y-m-d H:i:s');
        $contact->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $contact],
            201 );
    }
    public function update(Request $request, $id)
    {
        $contact = Contact::find($id);
        if($contact==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $contact->user_id = $request->user_id; //form
        $contact->name = $request->name; //form
        $contact->email = $request->email;
        $contact->phone = $request->phone; //form
        $contact->title = $request->title; //form
        $contact->content = $request->content; //form
        $contact->created_by = 1;
        $contact->status = $request->status; //form
        $contact->created_at = date('Y-m-d H:i:s');
        $contact->save(); //Luuu vao CSDL
        
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $contact],
            200
        );
    }
    public function destroy($id)
    {
        $contact=Contact::find($id);
        if($contact==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $contact->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}

}
