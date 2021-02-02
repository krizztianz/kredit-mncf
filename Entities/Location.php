<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $ID
 * @property string $value
 * @property string $caption
 * @property string $url
 * @property string $latLng
 * @property double $Lat
 * @property double $Lng
 * @property string $ISACTIVE
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 */
class Location extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'location';

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
     * Timestamp
     */
    const CREATED_AT = 'CRE_DATE';
    const UPDATED_AT = 'MOD_DATE';

    /**
     * @var array
     */
    protected $fillable = ['value', 'caption', 'url', 'latLng', 'Lat', 'Lng', 'ISACTIVE', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];

}
