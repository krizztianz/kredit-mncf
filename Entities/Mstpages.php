<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $ID
 * @property string $page_name
 * @property string $page_url
 * @property string $page_slug
 * @property integer $parent_page_id
 * @property integer $page_menu_id
 * @property string $description
 * @property string $ISACTIVE
 * @property integer $CRE_BY
 * @property string $CRE_DATE
 * @property integer $MOD_BY
 * @property string $MOD_DATE
 */
class Mstpages extends Model
{
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
    protected $fillable = ['page_name', 'page_url', 'page_slug', 'parent_page_id', 'page_menu_id', 'description', 'ISACTIVE', 'CRE_BY', 'CRE_DATE', 'MOD_BY', 'MOD_DATE'];

}
