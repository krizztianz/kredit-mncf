<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $ID
 * @property string $opt
 * @property string $descs
 * @property float $min
 * @property float $max
 * @property string $ISACTIVE
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 */
class OptJumlahPinjaman extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'optjumlahpinjaman';

    /**
     * The primary key for the model.
     * 
     * @var string
     */
    protected $primaryKey = 'ID';
    
    /**
     * Timestamp
     */
    const CREATED_AT = 'CRE_DATE';
    const UPDATED_AT = 'MOD_DATE';

    /**
     * @var array
     */
    protected $fillable = ['opt', 'descs', 'min', 'max', 'ISACTIVE', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];

}
