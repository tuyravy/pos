<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ModeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'look_id' => $this->look_id,
            'short_name' => $this->short_name,
            'full_name_en'=> $this->full_name_en,
        ];
    }
}
