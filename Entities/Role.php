<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use \Illuminate\Database\Eloquent\Model;

/**
 * @property integer $ID
 * @property string $role_name
 * @property string $role_slug
 * @property string $description
 * @property string $ISACTIVE
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 */
class Role extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'role';

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
    protected $fillable = ['role_name', 'role_slug', 'description', 'ISACTIVE', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];

}
