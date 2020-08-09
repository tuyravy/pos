<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DynamicFormResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return 
            [
            'label'=>$this->label,
            'name'=>$this->name,
            'type'=>$this->type,
            'placeholder'=>$this->placeholder,
            'value'=>$this->value,
          ];
    }
}
