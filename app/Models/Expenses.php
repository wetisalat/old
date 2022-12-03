<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\File;

class Expenses extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'expense';

    public static function fileUpload($request) {

        $image = $request->attachment;

        if($image){

                $img = $image;

                $folderPath = 'images/expenses/';

                if (! File::exists('images/expenses')){
                    File::makeDirectory('images/expenses', 0777, true);
                }
                $imageName = time().'.'.explode('/',explode(':',
                        substr($image,0, strpos($image, ';')))[1])[1];

                $image_parts = explode(";base64,", $img);
                $image_base64 = base64_decode($image_parts[1]);

                $file = $folderPath . $imageName;
                file_put_contents($file, $image_base64);

                return $imageName;
        }

    }

    public static function fileUpdated($request, $expenses) {

        $image = $request->attachment;

        if($image != $expenses->attachment){

                $img = $image;

                $folderPath = 'images/expenses/';

                if (! File::exists('images/expenses')){
                    File::makeDirectory('images/expenses', 0777, true);
                }

                $imageName = time().'.'.explode('/',explode(':',
                            substr($image,0, strpos($image, ';')))[1])[1];

                $image_parts = explode(";base64,", $img);
                $image_base64 = base64_decode($image_parts[1]);

                $file = $folderPath . $imageName;
                file_put_contents($file, $image_base64);

                if (file_exists($expenses->attachment)){
                    @unlink($expenses->attachment);
                }
                return $imageName;
        }else{

            return $file = $expenses->attachment;
        }

    }

}
