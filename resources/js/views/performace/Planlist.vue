<template>
  <div class="app-container">
    <el-form :inline="true" :model="form" class="demo-form-inline">
      <el-form-item label="Choose Company">
        <el-select
          v-model="query.CompanyCode"
          clearable
          class="filter-item"
          placeholder="Please select your compnay"
          @change="handleFilter"
        >
          <el-option
            v-for="item in listcompany"
            :key="item.CompanyCode"
            :label="item.company_name_en"
            :value="item.CompanyCode"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          @change="handleFilter"
        >{{ $t('table.search') }}</el-button>
        <el-button
          v-waves
          :loading="loading"
          class="filter-item"
          type="primary"
          icon="el-icon-download"
          @click="handleDownload"
        >{{ $t('table.export') }}</el-button>
        <template>
          <router-link target="_blank" to="/pdf/download">
            <el-button type="primary" icon="el-icon-download">Download PDF</el-button>
          </router-link>
        </template>
      </el-form-item>
    </el-form>
    <el-table v-loading="loading" :data="list" border fit highlight-current-row style="width: 100%">
      <el-table-column align="left" label="Plan Name">
        <template slot-scope="scope">
          <span>{{ scope.row.PlanName }}</span>
        </template>
      </el-table-column>
      <el-table-column align="left" label="Plan Mode">
        <template slot-scope="scope">
          <span>{{ scope.row.PlanModeName }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Plan Date" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.PlanDate }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="Company Name" width="210">
        <template slot-scope="scope">
          <span>{{ scope.row.CompanyName }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="Posted By" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.PostedBy }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Authorized By" width="120">
        <template slot-scope="scope">
          <span style="font-style: italic;">{{ scope.row.AuthorizedBy }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Status" width="120">
        <template slot-scope="scope">
          <span v-if="scope.row.status==1">
            <el-badge value="not yet approve" class="item" />
          </span>
          <span v-else-if="scope.row.status==0">
            <el-badge value="approve" class="item" type="success" />
          </span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Actions" width="250">
        <template slot-scope="scope">
          <router-link
            :to="'/performace/planlist/edit/'+scope.row.CompanyId"
          >
            <el-button type="primary" size="small" icon="el-icon-edit" />
          </router-link>
          <el-button
            v-if="scope.row.status==0"
            :disabled="true"
            size="small"
            type="danger"
            icon="el-icon-delete"
            @click="handleDelete(scope)"
          />
          <el-button
            v-if="scope.row.status==1"
            :disabled="false"
            size="small"
            type="danger"
            icon="el-icon-delete"
            @click="handleDelete(scope)"
          />
          <el-button
            v-if="scope.row.status==0"
            :disabled="true"
            size="small"
            type="success"
            icon="el-icon-check"
            @click="handleApprove(scope)"
          />
          <el-button
            v-if="scope.row.status==1"
            :disabled="false"
            size="small"
            type="success"
            icon="el-icon-check"
            @click="handleApprove(scope)"
          />
        </template>
      </el-table-column>
    </el-table>
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="query.page"
      :limit.sync="query.limit"
      @pagination="getList"
    />
    <!--  From Approve -->
    <el-dialog title="Authorize" :visible.sync="centerDialogVisible" width="30%">
      <div class="form-container">
        <el-form ref="loginForm" :model="loginForm" :rules="loginRules">
          <el-form-item label="User Name" prop="email">
            <el-input
              v-model="loginForm.email"
              type="text"
              name="email"
              placeholder="please input your username"
            />
          </el-form-item>
          <el-form-item label="Password" prop="password">
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
  </div>
</template>
<script>
import Pagination from '@/components/Pagination';
import Resource from '@/api/resource';
import { validEmail } from '@/utils/validate';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive

const PlanlistResource = new Resource('plan');
const CompanyResource = new Resource('company');
const PlanDeleteResource = new Resource('delete_plan');
const AuthorizeResource = new Resource('plan/authorized');

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
      loginRules: {
        email: [{ required: true, trigger: 'blur', validator: validateEmail }],
        password: [
          { required: true, trigger: 'blur', validator: validatePass },
        ],
      },
      loginForm: {
        email: '',
        password: '',
        companyid: '',
        PlanDate: '',
      },
      pwdType: 'password',
      redirect: undefined,
      branch: {},
      listpro: {},
      lists: {},
      listcompany: {},
      dialogFormVisible: false,
      centerDialogVisible: false,
      loading: true,
      btnStatus: true,
      list: null,
      total: 0,
      rules: {},
      query: {
        page: 1,
        limit: 15,
        CompanyCode: '',
      },
      form: {
        name: '',
        BrName: '',
        TrnName: '',
        date: '',
        delivery: false,
        type: [],
        resource: '',
        companyid: '',
        desc: '',
        amount: '',
        TrnMode: '',
        CompanyName: '',
        company_name_en: '',
        ccy: '',
      },
    };
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true,
    },
  },
  created() {
    this.getList();
    this.getCompany();
  },
  methods: {
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data } = await PlanlistResource.list(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.loading = false;
    },
    // select data Mdoe from table
    async getCompany() {
      this.Companyfilter = true;
      const { data } = await CompanyResource.list({});
      this.listcompany = data;
      this.Companyfilter = false;
    },
    handleDelete(scope) {
      this.form.companyid = scope.row.CompanyId;
      this.form.PlanDate = scope.row.PlanDate;
      this.$confirm(`Are you sure you want to delete?`, '', { type: 'warning' })
        .then(() => {
          PlanDeleteResource.store(this.form);
          this.$message({
            message: 'Plan information has been delete successfully',
            type: 'success',
            duration: 5 * 1000,
          });
          this.getList();
        })
        .catch(error => {
          console.log(error);
        });
    },
    handleApprove(scope) {
      this.loginForm.companyid = scope.row.CompanyId;
      this.loginForm.PlanDate = scope.row.PlanDate;
      this.centerDialogVisible = true;
    },
    handleEdit(scope) {
      this.form.TrnName = scope.row.PrName;
      this.form.TrnAmt = scope.row.TrnAmt;
      this.form.company_name_en = scope.row.CompanyName;
      this.form.Company_id = scope.row.Company_id;
      this.dialogFormVisible = true;
    },
    handleFilter() {
      this.Companyfilter = true;
      this.getList();
      this.Companyfilter = false;
    },
    showPwd() {
      if (this.pwdType === 'password') {
        this.pwdType = '';
      } else {
        this.pwdType = 'password';
      }
    },
    handleDownload() {
      import('@/vendor/Export2Excel').then(excel => {
        this.loading = true;
        const tHeader = [
          'Plan Name',
          'Plan Date',
          'Company Name',
          'Posted By',
          'Company Name',
          'Branch Name',
          'Posted By',
          'Posteddate',
          'Authorized By',
          'status',
        ];
        const filterVal = [
          'index',
          'PrName',
          'TrnDate',
          'TrnAmt',
          'CompanyName',
          'BrName',
          'created_by',
          'Posteddate',
          'authorized_by',
          'smsstatus',
        ];
        const data = this.formatJson(filterVal, this.list);
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'Performace Sale-list',
        });
        this.loading = false;
      });
    },
    formatJson(filterVal, jsonData) {
      return jsonData.map(v => filterVal.map(j => v[j]));
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
              this.btnStatus = false;
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
  },
};
</script>

<style lang="scss" scoped>
.el-table th {
  background: #1e9fda;
  color: white;
  pointer-events: none;
}
.item {
  margin-top: 10px;
  justify-content: space-between;
  margin-right: 40px;
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
