<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;
class SliderController extends Controller
{
    public function trash()   
    {
        $Sliders = Slider::where('trash',1)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $Sliders],
            200 );
    }
public function sortdelete(Request $request,$id){
    $Slider = Slider::find($id);
    $Slider->trash = '1';
    $Slider->save(); //Luuu vao CSDL
        if($Slider==null){
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
    $Slider = Slider::find($id);
    $Slider->trash = '0';
    $Slider->save(); //Luuu vao CSDL
        if($Slider==null){
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
        $sliders = Slider::where('trash',0)
        ->orderBy('created_at','DESC')->get();
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $sliders],
            200 );
    }
    public function show($id)
    {
        $slider = Slider::find($id);
        if($slider==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
        return response()->json(
            ['success' => true, 'message' => 'Tải dữ liệu thành công', 'data' => $slider],
            200
        );
    }

    public function store(Request $request)   
    {
        $slider =  new Slider();
        $slider->name = $request->name; //form
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $slider->name . '.' . $extension;
                $slider->image = $filename;
                $files->move(public_path('images/slider'), $filename);
            }
        }
        $slider->sort_order = $request->sort_order; //form
        $slider->link = $request->link; //form
        $slider->position = $request->position; //form
        $slider->created_by = 1;
        $slider->status = $request->status; //form
        $slider->created_at = date('Y-m-d H:i:s');
        $slider->save(); //Luuu vao CSDL
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $slider],
            201 );
    }
    public function update(Request $request, $id)
    {
        $slider = Slider::find($id);
        $slider->name = $request->name; //form
        $files = $request->image;
        if ($files != null) {
            $extension = $files->getClientOriginalExtension();
            if (in_array($extension, ['jpg', 'png', 'gif', 'webp', 'jpeg'])) {
                $filename = $slider->name . '.' . $extension;
                $slider->image = $filename;
                $files->move(public_path('images/slider'), $filename);
            }
        }
        $slider->sort_order = $request->sort_order; //form
        $slider->link = $request->link; //form
        $slider->position = $request->position; //form
        $slider->created_by = 1;
        $slider->status = $request->status; //form
        $slider->created_at = date('Y-m-d H:i:s');
        $slider->save(); //Luuu vao CSDL
        if($slider==null){
            return response()->json(
                ['success' => false, 'message' => 'Tải dữ liệu không thành công', 'data' => null],
                404
            );
        }
       
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'data' => $slider],
            200
        );
    }
    public function destroy($id)
    {
        $slider=Slider::find($id);
        if($slider==null){
            return response()->json(
                ['success' => false, 'message' => 'Xóa dữ liệu không thành công', 'data' => null],
                404
            );
        }
        $slider->delete();
        return response()->json(
            ['success' => true, 'message' => 'Thành công', 'id' => $id],
            200
        );
}
public function slider_list($position)
{
    $args = [
        ['position', '=', $position],
        ['status', '=', 1]
    ];
    $sliders = Slider::where($args)
        ->orderBy('sort_order', 'ASC')
        ->get();
    return response()->json(
        [
            'success' => true,
            'message' => 'Tải dữ liệu thành công',
            'sliders' => $sliders
        ],
        200
    );
}



}
