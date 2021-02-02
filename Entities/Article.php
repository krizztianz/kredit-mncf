<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use \Illuminate\Database\Eloquent\Model;

/**
 * @property integer $ID
 * @property string $article_title
 * @property string $article_body
 * @property string $article_slug
 * @property string $article_thumbnail
 * @property integer $author
 * @property string $ISACTIVE
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 * @property User $user
 */
class Article extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'article';

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
    protected $fillable = ['article_title', 'article_body', 'article_slug', 'article_thumbnail', 'author', 'ISACTIVE', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('Entities\User', 'author', 'ID');
    }

}
