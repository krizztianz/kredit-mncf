<?php
namespace Entities;

defined('BASEPATH') OR exit('No direct script access allowed');

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $ID
 * @property string $nama
 * @property string $email
 * @property string $phone
 * @property string $agunan
 * @property string $jenisidentitas
 * @property string $nomoridentitas
 * @property string $alamat
 * @property string $kotaprovinsi
 * @property string $lokasiagunan
 * @property string $jumlahpinjaman
 * @property string $status
 * @property string $ISACTIVE
 * @property string $CRE_DATE
 * @property string $CRE_BY
 * @property string $MOD_DATE
 * @property string $MOD_BY
 */
class PengajuanKredit extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'pengajuankredit';

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
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['nama', 'email', 'phone', 'agunan', 'jenisidentitas', 'nomoridentitas', 'alamat', 'kotaprovinsi', 'lokasiagunan', 'jumlahpinjaman', 'status', 'ISACTIVE', 'CRE_DATE', 'CRE_BY', 'MOD_DATE', 'MOD_BY'];

}
