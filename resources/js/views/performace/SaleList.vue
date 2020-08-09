<template>
  <div class="app-container">
    <el-form :inline="true" :model="form" class="demo-form-inline">
      <el-form-item label="Choose company">
        <el-select
          v-model="query.CompanyId"
          clearable
          class="filter-item"
          placeholder="Please select your company"
          @change="handleFilter"
        >
          <el-option
            v-for="item in listcompany"
            :key="item.Company_id"
            :label="item.company_name_en"
            :value="item.Company_id"
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
          :loading="downloading"
          class="filter-item"
          type="primary"
          icon="el-icon-download"
          @click="handleDownload"
        >{{ $t('table.export') }}</el-button>
        <template>
          <router-link target="_blank" to="/pdf/download_sale/">
            <el-button type="primary" icon="el-icon-download">Download PDF</el-button>
          </router-link>
        </template>
      </el-form-item>
    </el-form>
    <el-table v-loading="loading" :data="list" border fit highlight-current-row style="width: 100%">
      <el-table-column align="center" label="ID" width="70">
        <template slot-scope="scope">
          <span>{{ scope.row.index }}</span>
        </template>
      </el-table-column>
      <el-table-column align="left" label="Product Name" width="200">
        <template slot-scope="scope">
          <span>{{ scope.row.PrName }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="TrnDate" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.TrnDate }}</span>
        </template>
      </el-table-column>

      <el-table-column align="center" label="TrnAmt" width="120">
        <template slot-scope="scope" style="text-align:right">
          <span v-if="scope.row.ccy=='KHR'">{{ scope.row.TrnAmt | numFormat('0,0') }}</span>
          <span v-if="scope.row.ccy=='USD'">{{ scope.row.TrnAmt | numFormat('0,0.00') }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Ccy" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.ccy }}</span>
        </template>
      </el-table-column>
      <el-table-column align="left" label="Company Name" width="220">
        <template slot-scope="scope">
          <span>{{ scope.row.CompanyName }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Branch Name" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.BrName }}</span>
        </template>
      </el-table-column>
      <el-table-column align="left" label="Posted By" width="120">
        <template slot-scope="scope">
          <span style="font-style: italic;">{{ scope.row.created_by }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Posted Date" width="120">
        <template slot-scope="scope">
          <span>{{ scope.row.Posteddate }}</span>
        </template>
      </el-table-column>
      <el-table-column align="left" label="Authorized By" width="130">
        <template slot-scope="scope">
          <span
            v-if="scope.row.status == 1"
            style="font-style: italic;"
          >{{ scope.row.authorized_by }}</span>
          <span
            v-if="!scope.row.status == 1"
            style="font-style: italic;"
          >{{ scope.row.authorized_by }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Authorized date" width="130">
        <template slot-scope="scope">
          <span>{{ scope.row.authorized_date }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Updated by" width="130">
        <template slot-scope="scope">
          <span style="font-style: italic;">{{ scope.row.updated_by }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Status" width="120">
        <template slot-scope="scope">
          <span v-if="scope.row.status == 1">
            <el-badge value="not yet approve" class="item" />
          </span>
          <span v-else-if="scope.row.status == 0">
            <el-badge value="approve" class="item" type="success" />
          </span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="Actions" width="180">
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
          <el-button type="primary" @click.native.prevent="handleLogin">{{ $t('table.confirm') }}</el-button>
        </div>
      </div>
    </el-dialog>
    <!--End  From Approve -->
  </div>
</template>
<script>
import Pagination from '@/components/Pagination'; // Secondary package based on el-pagination
import Resource from '@/api/resource';
import { validEmail } from '@/utils/validate';
import waves from '@/directive/waves'; // Waves directive
import permission from '@/directive/permission'; // Waves directive

const SaleDailyResource = new Resource('sales');
const GetbranchResource = new Resource('GetBranch');
const ProductResource = new Resource('products');
const ModeResource = new Resource('modes');
const CompanyResource = new Resource('company');
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
      listpro: {},
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
    this.getCompany();
    this.getProduct();
    this.getMode();
  },
  methods: {
    async getList() {
      const { limit, page } = this.query;
      this.loading = true;
      const { data, meta } = await SaleDailyResource.list(this.query);
      this.list = data;
      this.list.forEach((element, index) => {
        element['index'] = (page - 1) * limit + index + 1;
      });
      this.total = meta.total;
      this.loading = false;
    },
    async getBranch() {
      this.Companyfilter = true;
      const { data } = await GetbranchResource.list();
      this.branch = data;
      this.Companyfilter = false;
    },
    // select data Mdoe from table
    async getCompany() {
      this.Companyfilter = true;
      const { data } = await CompanyResource.list({});
      this.listcompany = data;
      this.Companyfilter = false;
    },
    // select data Mdoe from table
    async getMode() {
      this.downloading = true;
      const { data } = await ModeResource.list({});
      this.lists = data;
      this.downloading = false;
    },
    // select data Product from table
    async getProduct() {
      this.downloading = true;
      const { data } = await ProductResource.list(this.form);
      this.listpro = data;
      this.downloading = false;
    },
    headleUserEditing() {},

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
    // Event change Product
    handleFilterProduct() {
      this.Companyfilter = true;
      this.getProduct();
      this.Companyfilter = false;
    },
    // Event search Branch
    handleFilter() {
      this.Companyfilter = true;
      this.getList();
      this.Companyfilter = false;
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
        this.downloading = true;
        const tHeader = [
          'id',
          'Product Name',
          'TrnDate',
          'TrnAmt',
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
        this.downloading = false;
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
