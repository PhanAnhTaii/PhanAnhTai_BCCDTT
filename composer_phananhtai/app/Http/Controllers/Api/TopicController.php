<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Topic;
use Illuminate\Support\Str;

class TopicController extends Controller
{
    public function trash()   
    {
        $Topics = Topic::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Topics],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Topic = Topic::find($id);
    $Topic->trash = '1';
    $Topic->save(); //Luuu vao CSDL
        if($Topic==null){
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
    $Topic = Topic::find($id);
    $Topic->trash = '0';
    $Topic->save(); //Luuu vao CSDL
        if($Topic==null){
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
        $topics = Topic::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $topics],
            200 );
    }
    public function show($id)
    {
        
        if(is_numeric($id))
        {
            $topic = Topic::find($id);
        }
        else{
            $topic = Topic::where('slug',$id)->first();;
        }
        if($topic==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $topic],
            200
        );
    }
    public function store(Request $request)   
    {
        $topic =  new Topic();
        $topic->name = $request->name; //form
        $topic->slug = Str::of($request->name)->slug('-');
        $topic->parent_id = $request->parent_id;
        $topic->metakey = $request->metakey; //form
        $topic->metadesc = $request->metadesc; //form
        $topic->created_by = 1;
        $topic->status = $request->status; //form
        $topic->created_at = date('Y-m-d H:i:s');
        $topic->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $topic],
            201 );
    }
    public function update(Request $request, $id)
    {
        $topic = Topic::find($id);
        if($topic==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $topic->name = $request->name; //form
        $topic->slug = Str::of($request->name)->slug('-');
        $topic->parent_id = $request->parent_id;
        $topic->metakey = $request->metakey; //form
        $topic->metadesc = $request->metadesc; //form
        $topic->created_by = 1;
        $topic->status = $request->status; //form
        $topic->created_at = date('Y-m-d H:i:s');
        $topic->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $topic],
            200
        );
    }
    public function destroy($id)
    {
        $topic=Topic::find($id);
        if($topic==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $topic->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
public function topic_list($parent_id = 0)
    {
        $args = [
            ['parent_id', '=', $parent_id],
            ['status', '=', 1]
        ];
        $topics = Topic::where($args)
            
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'topics' => $topics
            ],
            200
        );
    }
}
