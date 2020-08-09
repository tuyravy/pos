<template>
  <div class="app-container">
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-tab-pane :label="$t('filter')" name="first" class="active">
          <el-form :inline="true" :model="form" class="demo-form-inline">
            <el-form-item :label="$t('Branch')">
              <el-select
                v-model="query.brcode"
                :placeholder="$t('BranchHolder')"
                clearable
                filterable
                class="filter-item"
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
            <el-form-item :label="$t('FromDate')" prop="From">
              <el-col style="width:150px">
                <el-date-picker
                  v-model="form.SaleFrom"
                  type="date"
                  :placeholder="$t('FromDateHolder')"
                  style="width: 100%;"
                />
              </el-col>
            </el-form-item>
            <el-form-item :label="$t('ToDate')" prop="To">
              <el-col style="width:150px">
                <el-date-picker
                  v-model="form.SaleTo"
                  type="date"
                  :placeholder="$t('ToDateHolder')"
                  style="width: 100%;"
                  @change="ChangeDate"
                />
              </el-col>
            </el-form-item>
            <el-form-item>
              <el-button type="danger" icon="el-icon-remove" @change="handleFilter">{{ $t('Button.Clear') }} </el-button>
              <el-button
                v-waves
                :loading="loading"
                class="filter-item"
                type="primary"
                icon="el-icon-download"
                @click="handleDownload"
              />
              <template>
                <router-link to="/sales/addsale/">
                  <el-button type="success" icon="el-icon-plus">{{ $t('Button.Add') }}</el-button>
                </router-link>
              </template>
            </el-form-item>
          </el-form>
        </el-tab-pane>
        <el-tab-pane :label="$t('adSerch')" name="second">
          <el-form :inline="true" :model="form" class="demo-form-inline">
            <el-form-item :label="$t('adSerch')">
              <el-input v-model="query.search" style="width:400px" @change="handlesearch" />
            </el-form-item>
            <el-button
              v-waves
              :loading="loading"
              class="filter-item"
              type="primary"
              icon="el-icon-search"
              @click="handlesearch"
            >{{ $t('Button.Search') }}</el-button>
          </el-form>
          <label style="font-style:italic">Date:format:(Ex:01-02-2020,2020-02-01)</label>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <pre />
    <el-card>
      <el-tabs v-model="activeActivity">
        <el-table
          v-loading="loading"
          :data="list"
          border
          fit
          highlight-current-row
          style="width: 100%"
        >
          <el-table-column align="center" :label="$t('table.Actions')" width="100">
            <template slot-scope="scope">
              <el-dropdown>
                <span class="el-dropdown-link">
                  dropdown<i class="el-icon-arrow-down el-icon--right" />
                </span>
                <el-dropdown-menu slot="dropdown" size="mini">
                  <el-dropdown-item icon="el-icon-document">
                    <span @click="SaleDetail(scope.row.sale_id)">Sale Detail</span>
                  </el-dropdown-item>
                  <el-dropdown-item icon="el-icon-money">View Payments</el-dropdown-item>
                  <el-dropdown-item icon="el-icon-money">
                    <span @click="dialog = true">Add Payment</span>
                  </el-dropdown-item>
                  <el-dropdown-item icon="el-icon-truck">
                    <span @click="addDelivery()">Add Delivery</span>
                  </el-dropdown-item>
                  <el-dropdown-item icon="el-icon-edit-outline">
                    <span @click="EditSale(scope.row.sale_id)">Edit Sale</span>
                  </el-dropdown-item>
                  <el-dropdown-item icon="el-icon-document">Download PDF</el-dropdown-item>
                  <el-dropdown-item icon="el-icon-d-arrow-left">Return Sale</el-dropdown-item>
                  <el-dropdown-item icon="el-icon-delete-solid">Delete Sale</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </template>
          </el-table-column>
          <el-table-column sortable align="center" :label="$t('table.SaleDate')" width="150" prop="SaleDate">
            <template slot-scope="scope">
              <span>{{ scope.row.SaleDate }}</span>
            </template>
          </el-table-column>
          <el-table-column sortable align="center" :label="$t('table.SaleId')" width="110" prop="sale_id">
            <template slot-scope="scope">
              <span>{{ scope.row.sale_id }}</span>
            </template>
          </el-table-column>
          <el-table-column sortable align="left" :label="$t('table.Customer')" width="135" prop="customer">
            <template slot-scope="scope">
              <span>{{ scope.row.first_name_eng }} {{ scope.row.family_name_eng }}</span>
            </template>
          </el-table-column>
          <el-table-column sortable align="left" :label="$t('table.InvoiceNo')" width="140" prop="invoice_no">
            <template slot-scope="scope" style="text-align:right">
              <span>{{ scope.row.invoice_no }}</span>
            </template>
          </el-table-column>
          <el-table-column
            sortable
            align="left"
            :label="$t('table.PaymentStatus')"
            width="140"
            prop="PaymentStatus"
          >
            <template slot-scope="scope">
              <el-badge
                v-if="scope.row.salestatus=='Due'"
                :value="scope.row.PaymentStatus"
                type="danger"
                class="item"
              />
              <el-badge v-else :value="scope.row.PaymentStatus" type="success" class="item" style="margin-top:10px;" />
            </template>
          </el-table-column>
          <el-table-column sortable align="right" :label="$t('table.GrandTotal')" width="130" prop="GrandTotal">
            <template slot-scope="scope">
              <span>{{ scope.row.GrandTotal | numFormat('0,0.00') }}</span>
            </template>
          </el-table-column>
          <el-table-column sortable align="right" :label="$t('table.Paid')" width="130" prop="totalpaided">
            <template slot-scope="scope">
              <span>{{ scope.row.totalpaided }}</span>
            </template>
          </el-table-column>
          <el-table-column
            sortable
            align="center"
            :label="$t('table.DueAmount')"
            width="140"
            prop="total_due_amount"
          >
            <template slot-scope="scope">
              <span>{{ scope.row.total_due_amount }}</span>
            </template>
          </el-table-column>
          <el-table-column align="left" :label="$t('table.Biller')" width="120" prop="created_by">
            <template slot-scope="scope">
              <span style="font-style: italic;">{{ scope.row.created_by }}</span>
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
      </el-tabs>
    </el-card>
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
          <el-button type="primary" @click.native.prevent="handleLogin">{{ $t('table.confirm') }}</el-button>
        </div>
      </div>
    </el-dialog>
    <!--End  From Approve -->
    <el-drawer
      title="Payment Confirm"
      :before-close="handleClose"
      :visible.sync="dialog"
      direction="rtl"
      size="50%"
    >
      <div class="demo-drawer__content">
        <paymentinfo />
        <div class="demo-drawer__footer" />
      </div>
    </el-drawer>
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
import moment from 'moment';
import { validEmail } from '@/utils/validate';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive
import paymentinfo from './components/paymentinfo';
const SaleDailyResource = new Resource('sales');
const GetbranchResource = new Resource('GetBranch');
const AuthorizeResource = new Resource('sales/authorized');
export default {
  components: { paymentinfo, Pagination },
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
      dialog: false,
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
        sale_id: '',
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
        limit: 10,
        brcode: '',
        search: '',
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
        SaleTo: '',
        SaleFrom: '',
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
      const { data, total } = await SaleDailyResource.list(this.query);
      this.list = data;
      this.total = total;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.loading = false;
    },
    async getBranch() {
      this.loading = true;
      const { data } = await GetbranchResource.list();
      this.ListBranch = data;
      this.loading = false;
    },
    SaleDetail(saleid) {
      this.$router.push('/sales/sale_detail/view/' + saleid);
    },
    EditSale(saleid) {
      this.$router.push('/sales/EditSale/view/' + saleid);
    },
    addDelivery() {
      this.$router.push('/delivery/adddelivery');
    },
    handleDelete(row) {
      this.$confirm(`Are you sure you want to delete?`, '', { type: 'warning' })
        .then(() => {
          SaleDailyResource.destroy(row);
          this.$message({
            message: 'Sales information has been delete successfully',
            type: 'success',
            duration: 5 * 1000,
          });
          this.getList();
          this.loading = false;
        })
        .catch(error => {
          console.log(error);
        });
    },
    handleApprove(sale_id) {
      this.loginForm.sale_id = sale_id;
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
      this.getList();
      this.loading = false;
    },
    ChangeDate() {
      this.loading = true;
      this.query.datestart = this.backEndDateFormat(this.form.SaleFrom);
      this.query.dateend = this.backEndDateFormat(this.form.SaleTo);
      this.getList();
      this.loading = false;
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
              this.getList();
              this.loading = false;
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
          'Biller',
          'Sale Date',
          'Customer Name',
          'invoice No',
          'Payment Status',
          'Grand Total',
          'Paided',
          'Due amount',
          'Balance',
        ];
        const filterVal = [
          'created_by',
          'SaleDate',
          'sale_id',
          'customer',
          'invoice_no',
          'PaymentStatus',
          'GrandTotal',
          'total_due_amount',
          'balance_amount',
        ];
        const data = this.formatJson(filterVal, this.list);
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'Sale-list',
        });
        this.loading = false;
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
    },
    handleClose(done) {
      this.$confirm('Do you want to cancel this transaction?')
        .then(_ => {
          this.loading = true;
          this.timer = setTimeout(() => {
            done();
            // animation takes time
          }, 500);
          this.loading = false;
        })
        .catch(_ => {});
    },
    cancelForm() {
      this.loading = false;
      this.dialog = false;
      clearTimeout(this.timer);
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    handleClick(tab, event) {
      console.log(tab, event);
    },
    async handlesearch() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, total } = await SaleDailyResource.list(this.query);
      this.list = data;
      this.total = total;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.loading = false;
    },
  },
};
</script>

<style lang="scss" scoped>

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
  font-size: 12px;
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
