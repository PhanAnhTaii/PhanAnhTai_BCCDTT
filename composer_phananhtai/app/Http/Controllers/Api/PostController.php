<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Topic;
use Illuminate\Support\Str;

class PostController extends Controller
{
    public function trash()   
    {
        $Posts = Post::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Posts],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Post = Post::find($id);
    $Post->trash = '1';
    $Post->save(); //Luuu vao CSDL
        if($Post==null){
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
    $Post = Post::find($id);
    $Post->trash = '0';
    $Post->save(); //Luuu vao CSDL
        if($Post==null){
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
        $posts = Post::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $posts],
            200 );
    }
    public function show($id)
    {
        $post = Post::find($id);
        if($post==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $post],
            200
        );
    }
    public function store(Request $request)   
    {
        $post =  new Post();
        $post->topic_id = $request->topic_id; //form
        $post->title = $request->title; //form
        $post->slug = Str::of($request->title)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $post->slug . '.' . $extension;
                $post->image = $filename;
                $files->move(public_path('images/postt'), $filename);
            }
        }
        $post->detail = $request->detail; //form
        $post->type = $request->type; //form
        $post->metakey = $request->metakey; //form
        $post->metadesc = $request->metadesc; //form
        $post->created_by = 1;
        $post->status = $request->status; //form
        $post->created_at = date('Y-m-d H:i:s');
        $post->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $post],
            201 );
    }
    public function update(Request $request, $id)
    {
        $post = Post::find($id);
        if($post==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $post->topic_id = $request->topic_id; //form
        $post->title = $request->title; //form
        $post->slug = Str::of($request->title)->slug('-');
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $post->slug . '.' . $extension;
                $post->image = $filename;
                $files->move(public_path('images/postt'), $filename);
            }
        }
        $post->detail = $request->detail; //form
        $post->type = $request->type; //form
        $post->metakey = $request->metakey; //form
        $post->metadesc = $request->metadesc; //form
        $post->created_by = 1;
        $post->status = $request->status; //form
        $post->created_at = date('Y-m-d H:i:s');
        $post->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $post],
            200
        );
    }
    public function destroy($id)
    {
        $post=Post::find($id);
        if($post==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $post->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
function post_list($type, $limit)
    {
        $args = [
            ['type', '=', $type],
            ['status', '=', 1]
        ];
        $posts = Post::where($args)
            ->orderBy('created_at', 'DESC')
            -> limit($limit)
            ->get();
        return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'posts' => $posts
            ],
            200
        );
    }
    public function post_home($limit, $topic_id = 0)
{
    $listid = array();
    array_push($listid, $topic_id + 0);
    $args_cat1 = [
        ['parent_id', '=', $topic_id + 0],
        ['status', '=', 1]
    ];
    $list_topic1 = Topic::where($args_cat1)->get();
    if (count($list_topic1) > 0) {
        foreach ($list_topic1 as $row1) {
            array_push($listid, $row1->id);
            $args_cat2 = [
                ['parent_id', '=', $row1->id],
                ['status', '=', 1]
            ];
            $list_topic2 = Topic::where($args_cat2)->get();
            if (count($list_topic2) > 0) {
                foreach ($list_topic2 as $row2) {
                    array_push($listid, $row2->id);
                }
            }
        }
    }
    $posts = Post::where('status', '=', 1)
        ->whereIn('topic_id', $listid)
        ->orderBy('created_at', 'DESC')
        ->limit($limit)
        ->get();

        if(count($posts)>0){
            return response()->json(
                [
                    'success' => true,
                    'message' => 'Tải dữ liệu thành công',
                    'posts' => $posts
                ],
                200
            );
        }
        else{
        return response()->json(
            [
                'success' => false,
                'message' => 'Tải dữ liệu thành công',
                'posts' => null
            ],
            200
        );}
}

public function post_topic($topic_id, $limit)
{
    $posts = Post::where([
    ['topic_id', '=', $topic_id], 
    ['status', '=', 1]])
        ->orderBy('created_at', 'DESC')
   
        ->limit($limit)
        ->get();
    return response()->json(
        [
            'success' => true,
            'message' => 'Tải dữ liệu thành công',
            'posts' => $posts
        ],
        200
    );
}
public function post_detail($slug)
    {
        $post=Post::where([['slug','=',$slug],['status', '=', 1]])->first();
        if($post==null){
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Không thành công',
                    'post' => null
                ],
                404
            );
        }
        $listid = array();
    array_push($listid, $post->topic_id );
    $args_cat1 = [
        ['parent_id', '=', $post->topic_id],
        ['status', '=', 1]
    ];
    $list_category1 = Topic::where($args_cat1)->get();
    if (count($list_category1) > 0) {
        foreach ($list_category1 as $row1) {
            array_push($listid, $row1->id);
            $args_cat2 = [
                ['parent_id', '=', $row1->id],
                ['status', '=', 1]
            ];
            $list_category2 = Topic::where($args_cat2)->get();
            if (count($list_category2) > 0) {
                foreach ($list_category2 as $row2) {
                    array_push($listid, $row2->id);
                }
            }
        }
    }
         $post_other=Post::where([['id','!=',$post->id],['status', '=', 1]])
         ->orderBy('created_at','DESC')
         ->whereIn('topic_id',$listid)
         ->limit(8)
         ->get();
            return response()->json(
            [
                'success' => true,
                'message' => 'Tải dữ liệu thành công',
                'post' => $post,
                'post_other'=>$post_other
            ],
            200
        );
        
    }
}
