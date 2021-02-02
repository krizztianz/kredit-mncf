<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use \Illuminate\Database\Eloquent\Model;

/**
 * @property integer $ID
 * @property string $userid
 * @property string $username
 * @property string $email
 * @property string $password
 * @property string $dateofbirth
 * @property string $placeofbirth
 * @property integer $roleid
 * @property string $ISACTIVE
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 * @property Article[] $articles
 */
class User extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'user';

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
    protected $fillable = ['userid', 'username', 'email', 'password', 'dateofbirth', 'placeofbirth', 'roleid', 'ISACTIVE', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function articles()
    {
        return $this->hasMany('Entities\Article', 'author', 'ID');
    }

}
