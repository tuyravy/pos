<?php
/**
 * File Role.php
 *
 * @author Tuan Duong <bacduong@gmail.com>
 * @package Laravue
 * @version
 */
namespace App\stsk\Models;

use App\stsk\Acl;
use Spatie\Permission\Models\Permission;

/**
 * Class Role
 *
 * @property Permission[] $permissions
 * @property string $name
 * @package App\Laravue\Models
 */
class Role extends \Spatie\Permission\Models\Role
{
    /**
     * Check whether current role is admin
     * @return bool
     */
    public function isAdmin(): bool
    {
        return $this->name === Acl::ROLE_ADMIN;
    }
}
