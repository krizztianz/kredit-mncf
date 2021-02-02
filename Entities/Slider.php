<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $ID
 * @property integer $page
 * @property string $slider_titile
 * @property string $slider_caption
 * @property string $slider_description
 * @property string $ISACTIVE
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 * @property SliderImage[] $sliderImages
 */
class Slider extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'slider';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'ID';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['page', 'slider_titile', 'slider_caption', 'slider_description', 'ISACTIVE', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function sliderImages()
    {
        return $this->hasMany('App\SliderImage', null, 'ID');
    }
}
