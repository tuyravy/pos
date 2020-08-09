<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity" @tab-click="handleClick">
        <el-tab-pane :label="$t('filter')" name="first" class="active">
          <el-form :inline="true" :model="form" class="demo-form-inline">
            <el-form-item :label="$t('Branch')">
              <el-select
                v-model="query.brcode"
                clearable
                filterable
                class="filter-item"
                :placeholder="$t('BranchHolder')"
                @change="handleFilter"
              >
                <el-option
                  v-for="item in ListBranch"
                  :key="item.BrCode"
                  :label="item.ShortCode"
                  :value="item.BrCode"
                />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button
                type="primary"
                icon="el-icon-search"
                @change="handleFilter"
              >{{ $t('Button.Search') }}</el-button>
              <el-button
                v-waves
                :loading="loading"
                class="filter-item"
                type="primary"
                icon="el-icon-download"
                @click="handleDownload"
              />
              <template>
                <router-link to="/delivery/adddelivery/">
                  <el-button type="success" icon="el-icon-plus">{{ $t('Button.Add') }}</el-button>
                </router-link>
              </template>
            </el-form-item>
          </el-form>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <pre />
    <el-card>
      <el-tabs v-model="activeActivity" @tab-click="handleClick">
        <el-tab-pane :label="$t('DeliveryInfo')" name="first" class="active">
          <el-table
            v-loading="loading"
            :data="list"
            border
            fit
            highlight-current-row
            style="width: 100%"
          >
            <el-table-column align="center" :label="$t('table.Id')" width="80">
              <template slot-scope="scope">
                <span>{{ scope.row.index }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.SaleId')" width="80">
              <template slot-scope="scope">
                <span>{{ scope.row.sale_id }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.DeliveryDate')" width="150">
              <template slot-scope="scope">
                <span>{{ scope.row.delivery_date }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" :label="$t('table.Wh_transferId')" width="110">
              <template slot-scope="scope">
                <span>{{ scope.row.wh_transfer_id }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" :label="$t('table.Refference_no')" width="110">
              <template slot-scope="scope">
                <span>{{ scope.row.refference_no }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" :label="$t('table.DriverBy')" width="120">
              <template slot-scope="scope">
                <span>{{ scope.row.company_name }}</span>
              </template>
            </el-table-column>

            <!-- <el-table-column align="left" label="Delivery Address" width="150">
              <template slot-scope="scope">
                <span>{{ scope.row.delivery_address }}</span>
              </template>
            </el-table-column>-->

            <el-table-column align="right" :label="$t('table.DeliveryCost')" width="120">
              <template slot-scope="scope" style="text-align:right">
                <span>{{ scope.row.delivery_cost }}</span>
              </template>
            </el-table-column>
            <el-table-column align="left" :label="$t('table.DeliveryStatus')" width="150">
              <template slot-scope="scope">
                <span>{{ scope.row.delivery_status }}</span>
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.status')" width="120">
              <template slot-scope="scope">
                <span v-if="scope.row.status == 1">
                  <el-badge value="not yet approve" class="item" />
                </span>
                <span v-else-if="scope.row.status == 0">
                  <el-badge value="approve" class="item" type="success" />
                </span>
              </template>
            </el-table-column>
            <el-table-column align="center" :label="$t('table.Actions')" width="180">
              <template slot-scope="scope">
                <router-link :to="'/performace/sales/edit/' + scope.row.Id">
                  <el-button type="primary" size="mini" icon="el-icon-edit" />
                </router-link>
                <el-button
                  v-if="scope.row.status == 1"
                  size="mini"
                  type="success"
                  icon="el-icon-check"
                  @click="handleApprove(scope.row.Id)"
                />
                <el-button
                  v-if="scope.row.status == 0"
                  :disabled="true"
                  size="mini"
                  type="success"
                  icon="el-icon-check"
                  @click="handleApprove(scope.row.Id)"
                />
                <el-button
                  v-if="scope.row.status == 1"
                  size="mini"
                  type="danger"
                  icon="el-icon-delete"
                  @click="handleDelete(scope.row.Id)"
                />
                <el-button
                  v-if="scope.row.status == 0"
                  :disabled="true"
                  size="mini"
                  type="danger"
                  icon="el-icon-delete"
                  @click="handleDelete(scope.row.Id)"
                />
              </template>
            </el-table-column>
          </el-table>
          <pagination
            v-show="total > 0"
            :total="total"
            :page.sync="query.page"
            :limit.sync="query.limit"
            @pagination="getList"
          />
          <!--  From Approve -->
          <el-dialog title :visible.sync="centerDialogVisible" width="30%" center>
            <div class="form-container">
              <el-form ref="loginForm" :model="loginForm" :rules="loginRules">
                <el-form-item label="UserName" :label-width="formLabelWidth" prop="email">
                  <el-input
                    v-model="loginForm.email"
                    type="text"
                    name="email"
                    placeholder="please input your username"
                  />
                </el-form-item>
                <el-form-item label="Password" :label-width="formLabelWidth" prop="password">
                  <el-input
                    v-model="loginForm.password"
                    :type="pwdType"
                    name="password"
                    placeholder="please input your password"
                  />
                </el-form-item>
              </el-form>
              <div slot="footer" class="dialog-footer">
                <el-button @click="centerDialogVisible = false">{{ $t('table.cancel') }}</el-button>
                <el-button
                  type="primary"
                  @click.native.prevent="handleLogin"
                >{{ $t('table.confirm') }}</el-button>
              </div>
            </div>
          </el-dialog>
          <!--End  From Approve -->
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>
<style>
.el-table th {
    background-color: rgba(192, 229, 253, 0.5);
    color:black;
    padding:3px !important;
}
.el-table td{
  padding:3px !important;
}
.el-dropdown-link {
    cursor: pointer;
    color: #409EFF;
  }
  .el-icon-arrow-down {
    font-size: 12px;
  }
</style>
<script>
import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
import Resource from '@/api/resource';
import { validEmail } from '@/utils/validate';
import moment from 'moment';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive

const DeliveryResource = new Resource('delivery');
const GetbranchResource = new Resource('GetBranch');
const AuthorizeResource = new Resource('sales/authorized');

export default {
  components: { Pagination },
  directives: { waves, permission },
  data() {
    const validateEmail = (rule, value, callback) => {
      if (!validEmail(value)) {
        callback(new Error('Please enter the correct email'));
      } else {
        callback();
      }
    };
    const validatePass = (rule, value, callback) => {
      if (value.length < 4) {
        callback(new Error('Password cannot be less than 4 digits'));
      } else {
        callback();
      }
    };

    return {
      activeActivity: 'first',
      loginRules: {
        email: [{ required: true, trigger: 'blur', validator: validateEmail }],
        password: [
          { required: true, trigger: 'blur', validator: validatePass },
        ],
      },
      loginForm: {
        email: '',
        password: '',
        Id: '',
      },
      pwdType: 'password',
      redirect: undefined,
      branch: {},
      ListBranch: {},
      lists: {},
      listcompany: {},
      dialogFormVisible: false,
      centerDialogVisible: false,
      downloading: true,
      btnStatus: false,
      list: null,
      total: 0,
      rules: {},
      loading: true,
      query: {
        page: 1,
        limit: 15,
        brcode: '',
      },
      form: {
        Id: '',
        name: '',
        BrName: '',
        TrnName: '',
        PrName: '',
        date: '',
        delivery: false,
        type: [],
        resource: '',
        Company_id: '',
        desc: '',
        TrnMode: '',
        amount: '',
        CompanyName: '',
        ccy: '',
      },
      formLabelWidth: '100px',
    };
  },
  created() {
    this.getList();
    this.getBranch();
  },
  methods: {
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, meta } = await DeliveryResource.list(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.total = meta.total;
      this.loading = false;
    },
    async getBranch() {
      this.loading = true;
      const { data } = await GetbranchResource.list();
      this.ListBranch = data;
      this.loading = false;
    },
    handleDelete(row) {
      this.$confirm(`Are you sure you want to delete?`, '', { type: 'warning' })
        .then(() => {
          DeliveryResource.destroy(row);
          this.$message({
            message: 'Sales information has been delete successfully',
            type: 'success',
            duration: 5 * 1000,
          });
          this.getList();
        })
        .catch(error => {
          console.log(error);
        });
    },
    handleApprove(Id) {
      this.loginForm.Id = Id;
      this.centerDialogVisible = true;
    },
    // Event Update data
    handleEdit(scope) {
      this.form = scope.row;
      this.dialogFormVisible = true;
    },
    handleFilter() {
      this.loading = true;
      this.getBranch();
      this.loading = false;
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    forntEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD hh:mm:ss');
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          AuthorizeResource.store(this.loginForm)
            .then(() => {
              this.loading = false;
              this.$message({
                message: 'Approved has  successfully',
                type: 'success',
                duration: 5 * 1000,
              });
              this.centerDialogVisible = false;
              this.btnStatus = true;
              this.getList();
            })
            .catch(() => {
              this.loading = false;
            });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    handleDownload() {
      import('@/vendor/Export2Excel').then(excel => {
        this.loading = true;
        const tHeader = [
          'ID',
          'SaleId',
          'Delivery Date',
          'Wh_transferId',
          'Refference_no',
          'Driver By',
          'Delivery Address',
          'Delivery Cost',
          'Delivery Status',
          'Posted By',
          'Posted Date',
          'Authorized By',
          'Authorized date',
          'Updated by',
        ];
        const filterVal = [
          'index',
          'sale_id',
          'delivery_date',
          'wh_transferId',
          'refference_no',
          'driver_By',
          'delivery_address',
          'delivery_cost',
          'delivery_status',
          'created_by',
          'created_at',
          'authorized_by',
          'authorized_date',
          'updated_by',
        ];
        const data = this.formatJson(filterVal, this.list);
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename:
            'RSK_GROUP_' +
            this.forntEndDateFormat(new Date()) +
            '_Delivery_list',
        });
        this.loading = false;
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
    },
  },
};
</script>

<style lang="scss" scoped>
.el-table th {
  background: #1e9fda;
  color: white;
  pointer-events: none;
}
.edit-input {
  padding-right: 100px;
}
.cancel-btn {
  position: absolute;
  right: 15px;
  top: 10px;
}
.dialog-footer {
  text-align: left;
  padding-top: 0;
  margin-left: 150px;
}
.app-container {
  flex: 1;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
  .block {
    float: left;
    min-width: 250px;
  }
  .clear-left {
    clear: left;
  }
}
</style>
