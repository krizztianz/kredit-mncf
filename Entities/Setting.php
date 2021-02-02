<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use \Illuminate\Database\Eloquent\Model;

/**
 * @property int $ID
 * @property string $sitename
 * @property string $sitelogo
 * @property string $aboutus
 * @property float $interest_rate
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 */
class Setting extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'generalsetting';

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
    protected $fillable = ['sitename', 'sitelogo', 'aboutus', 'interest_rate', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];

}
