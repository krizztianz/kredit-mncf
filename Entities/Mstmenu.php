<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use \Illuminate\Database\Eloquent\Model;

/**
 * @property integer $menuparentid
 * @property integer $ID
 * @property string $menu_title
 * @property string $menu_icon
 * @property string $menu_url
 * @property string $description
 * @property integer $queue
 * @property string $ISACTIVE
 * @property string $CRE_BY
 * @property string $CRE_DATE
 * @property string $MOD_BY
 * @property string $MOD_DATE
 * @property Mstmenu $mstmenu
 */
class Mstmenu extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'mstmenu';

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
    protected $fillable = ['menuparentid', 'menu_title', 'menu_icon', 'menu_url', 'description', 'queue', 'ISACTIVE', 'CRE_BY', 'CRE_DATE', 'MOD_BY', 'MOD_DATE'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function parentmenu()
    {
        return $this->hasMany('Entities\Mstmenu', 'menuparentid', 'ID');
    }

    public function childmenu()
    {
        return $this->parentmenu()->with("childmenu");
    }
}

